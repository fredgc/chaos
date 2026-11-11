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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

import 'app_localizations.dart';

export 'app_localizations.dart';

class LocaleController {
  static const String _keyLocale = 'app_locale';
  static const Locale autoLocale = Locale('auto');
  static final ValueNotifier<Locale?> currentLocale =
      ValueNotifier<Locale?>(null);

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('es'),
    Locale('de'),
    Locale('fr'),
    Locale('ja'),
    Locale('lt'),
    Locale('pt'),
    Locale('zh'),
  ];

  static String languageDisplayName(Locale? locale) {
    if (locale == null) return 'System Default';
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      case 'de':
        return 'Deutsch';
      case 'fr':
        return 'Français';
      case 'ja':
        return '日本語';
      case 'lt':
        return 'Lietuvių';
      case 'pt':
        return 'Português';
      case 'zh':
        return '中文 (简体)';
      default:
        return locale.toLanguageTag();
    }
  }

  static Future<void> initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final code = prefs.getString(_keyLocale);
      if (code != null && code.isNotEmpty) {
        currentLocale.value = Locale(code);
      }
    } catch (_) {}
  }

  static Future<void> setLocale(Locale? locale) async {
    final effective = (locale == null ||
            locale == autoLocale ||
            locale.languageCode == 'auto')
        ? null
        : locale;
    currentLocale.value = effective;
    try {
      final prefs = await SharedPreferences.getInstance();
      if (effective == null) {
        await prefs.remove(_keyLocale);
      } else {
        await prefs.setString(_keyLocale, effective.languageCode);
      }
    } catch (_) {}
  }
}

class LanguageSwitcherButton extends StatelessWidget {
  const LanguageSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language_rounded),
      tooltip: context.l10n.switchLanguageTooltip,
      initialValue:
          LocaleController.currentLocale.value ?? LocaleController.autoLocale,
      onSelected: (loc) => LocaleController.setLocale(loc),
      itemBuilder: (context) => [
        CheckedPopupMenuItem<Locale>(
          value: LocaleController.autoLocale,
          checked: LocaleController.currentLocale.value == null,
          child: Text(context.l10n.languageAuto),
        ),
        for (final locale in LocaleController.supportedLocales)
          CheckedPopupMenuItem<Locale>(
            value: locale,
            checked: LocaleController.currentLocale.value?.languageCode ==
                locale.languageCode,
            child: Text(LocaleController.languageDisplayName(locale)),
          ),
      ],
    );
  }
}

Future<String> loadLocalizedHtmlAsset(
    BuildContext context, String baseName) async {
  final locale = Localizations.localeOf(context).languageCode;
  if (locale != 'en') {
    try {
      return await rootBundle.loadString('assets/${baseName}_$locale.html');
    } catch (_) {
      // Fall back to default English document
    }
  }
  return await rootBundle.loadString('assets/$baseName.html');
}

String getLocalizedHtmlFileName(BuildContext context, String baseName) {
  final locale = Localizations.localeOf(context).languageCode;
  if (locale != 'en') {
    return '${baseName}_$locale.html';
  }
  return '$baseName.html';
}

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
