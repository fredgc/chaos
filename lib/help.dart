// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'help_nav_listener.dart';
import 'l10n/l10n_extension.dart';
import 'settings.dart';

class HelpScreen extends StatefulWidget {
  static const routeName = "/help";
  HelpScreen({super.key});

  static bool isExternalUrl(String href) {
    final trimmed = href.trim();
    return trimmed.startsWith('http://') ||
        trimmed.startsWith('https://') ||
        trimmed.startsWith('mailto:');
  }

  static String cleanNavTarget(String href) {
    String target = href.trim();
    if (target.contains('#')) {
      target = target.split('#').first;
    }
    if (target.contains('?')) {
      target = target.split('?').first;
    }
    if (target.startsWith('./')) {
      target = target.substring(2);
    }
    return target;
  }

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  double progress = 0;
  String currentFile = "about.html";
  HelpNavListener? _helpNavListener;

  static const _navScript = '''
<script>
document.addEventListener('click', function(e) {
  var a = e.target.closest('a');
  if (a) {
    var href = a.getAttribute('href');
    if (href && !href.startsWith('#')) {
      e.preventDefault();
      if (window.parent && window.parent !== window) {
        window.parent.postMessage('help_navigate:' + href, '*');
      }
      var f = window.flutter_inappwebview;
      if (f && f.callHandler) {
        f.callHandler('helpNavigate', href);
      }
    }
  }
});
</script>
''';

  @override
  void initState() {
    super.initState();
    LocaleController.currentLocale.addListener(_onLocaleChanged);
    _helpNavListener = HelpNavListener(_handleNavigation);
  }

  @override
  void dispose() {
    LocaleController.currentLocale.removeListener(_onLocaleChanged);
    _helpNavListener?.dispose();
    super.dispose();
  }

  void _onLocaleChanged() {
    if (mounted) {
      loadFile(currentFile);
      setState(() {});
    }
  }

  void _handleNavigation(String href) async {
    if (HelpScreen.isExternalUrl(href)) {
      final uri = Uri.tryParse(href.trim());
      if (uri != null) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
      return;
    }

    final target = HelpScreen.cleanNavTarget(href);
    if (target.isNotEmpty) {
      loadFile(target);
    }
  }

  String _effectiveLanguage() {
    final active = LocaleController.currentLocale.value?.languageCode;
    if (active != null && active.isNotEmpty) {
      return active;
    }
    final systemLang =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    const supported = {'en', 'es'};
    if (supported.contains(systemLang)) {
      return systemLang;
    }
    return 'en';
  }

  void loadFile(String filename) async {
    final baseWithExt =
        filename.endsWith('.html') ? filename : '$filename.html';
    final cleanBase =
        baseWithExt.replaceAll(RegExp(r'_[a-z]{2}\.html$'), '.html');
    currentFile = cleanBase;
    if (webViewController == null) {
      print("Not loading $filename because controller is null.");
      return;
    }
    final lang = _effectiveLanguage();
    String target = cleanBase;
    if (lang != 'en') {
      final dot = cleanBase.lastIndexOf('.');
      if (dot != -1) {
        target =
            "${cleanBase.substring(0, dot)}_$lang${cleanBase.substring(dot)}";
      }
    }
    print("load file $target.");
    String htmlContent;
    try {
      htmlContent = await rootBundle.loadString('assets/$target');
    } catch (_) {
      try {
        htmlContent = await rootBundle.loadString('assets/$cleanBase');
      } catch (ex) {
        print("RED: error loading $cleanBase. $ex");
        return;
      }
    }
    try {
      final css = await rootBundle.loadString('assets/css/doc_style.css');
      htmlContent =
          htmlContent.replaceFirst('</head>', '<style>$css</style></head>');
    } catch (_) {}

    if (htmlContent.contains('</body>')) {
      htmlContent = htmlContent.replaceFirst('</body>', '$_navScript</body>');
    } else {
      htmlContent = '$htmlContent$_navScript';
    }

    try {
      await webViewController?.loadData(data: htmlContent);
    } catch (e) {
      print("Error loading data into webview: $e");
    }
  }

  AppBar appBar(BuildContext context) {
    final settingsButton = IconButton(
      onPressed: () {
        Navigator.pushNamed(context, SettingsScreen.routeName);
      },
      icon: const Icon(Icons.settings),
      tooltip: context.l10n.settingsTooltip,
    );

    return AppBar(
      title: Text(context.l10n.helpTitle),
      leading: settingsButton,
      actions: <Widget>[
        ElevatedButton(
          child: Text(context.l10n.aboutButton),
          onPressed: () {
            loadFile(getLocalizedHtmlFileName(context, "about"));
          },
        ),
        ElevatedButton(
          child: Text(context.l10n.privacyButton),
          onPressed: () {
            loadFile(getLocalizedHtmlFileName(context, "privacy"));
          },
        ),
        ElevatedButton(
          child: Text(context.l10n.termsButton),
          onPressed: () {
            loadFile(getLocalizedHtmlFileName(context, "terms"));
          },
        ),
        ElevatedButton(
          child: Text(context.l10n.overviewButton),
          onPressed: () {
            loadFile(getLocalizedHtmlFileName(context, "help"));
          },
        ),
        ElevatedButton(
          child: Text(context.l10n.fieldsButton),
          onPressed: () {
            loadFile(getLocalizedHtmlFileName(context, "fields"));
          },
        ),
        ElevatedButton(
          child: Text(context.l10n.controlsButton),
          onPressed: () {
            loadFile(getLocalizedHtmlFileName(context, "controls"));
          },
        ),
        IconButton(
          icon: const Icon(Icons.close),
          tooltip: context.l10n.closeButtonTooltip,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  InAppWebView webview(BuildContext c) {
    var blankPage = InAppWebViewInitialData(data: """
      <!DOCTYPE html>
      <head></head> <body>${c.l10n.loadingText}</body></html>
      """);
    return InAppWebView(
      key: webViewKey,
      initialData: blankPage,
      initialSettings: InAppWebViewSettings(
        useShouldOverrideUrlLoading: true,
        javaScriptEnabled: true,
      ),
      onWebViewCreated: (controller) {
        webViewController = controller;
        controller.addJavaScriptHandler(
          handlerName: 'helpNavigate',
          callback: (args) {
            if (args.isNotEmpty && args[0] is String) {
              _handleNavigation(args[0] as String);
            }
          },
        );
        loadFile(getLocalizedHtmlFileName(c, "about"));
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        final uri = navigationAction.request.url;
        if (uri == null) return NavigationActionPolicy.ALLOW;
        final urlString = uri.toString();
        if (urlString.startsWith('http://') ||
            urlString.startsWith('https://') ||
            urlString.startsWith('mailto:')) {
          await launchUrl(uri.uriValue, mode: LaunchMode.externalApplication);
          return NavigationActionPolicy.CANCEL;
        }
        if (urlString != 'about:blank' && !urlString.startsWith('data:')) {
          _handleNavigation(urlString);
          return NavigationActionPolicy.CANCEL;
        }
        return NavigationActionPolicy.ALLOW;
      },
      onProgressChanged: (controller, progress) {
        setState(() {
          this.progress = progress / 100;
        });
      },
      onConsoleMessage: (controller, consoleMessage) {
        if (kDebugMode) {
          print(consoleMessage);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Settings.instance.theme.theme_data,
      child: Scaffold(
        appBar: appBar(context),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    Builder(builder: (BuildContext c) => webview(context)),
                    progress < 1.0
                        ? LinearProgressIndicator(value: progress)
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
