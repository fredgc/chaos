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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'field.dart';
import 'flow.dart';
import 'help.dart';
import 'l10n/l10n_extension.dart';
import 'settings.dart';
import 'widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleController.initialize();
  print("RED: Start of main.");
  MyAppBuilder builder = MyAppBuilder();
  FlowAppWidgetState.initSettings(Settings.instance);
  runApp(builder.makeApp());
}

class MyAppBuilder {
  Map<String, WidgetBuilder> routes = {};

  MyAppBuilder() {
    routes[SettingsScreen.routeName] =
        (BuildContext context) => SettingsScreen();
    routes[HelpScreen.routeName] = (BuildContext context) => HelpScreen();
    for (var f in FieldEnum.values) {
      routes[f.route] = makeBuilder(f);
    }
  }

  WidgetBuilder makeBuilder(FieldEnum f) {
    return (BuildContext context) => FlowAppWidget(FlowField(f), f);
  }

  Widget makeApp() {
    return ValueListenableBuilder<Locale?>(
      valueListenable: LocaleController.currentLocale,
      builder: (context, locale, _) {
        return MaterialApp(
          locale: locale,
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            if (deviceLocale != null) {
              for (final supported in supportedLocales) {
                if (supported.languageCode == deviceLocale.languageCode) {
                  return supported;
                }
              }
            }
            return const Locale('en');
          },
          onGenerateTitle: (context) => context.l10n.appTitle,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: Settings.instance.theme.theme_data,
          routes: routes,
          initialRoute: FieldEnum.rotate.route,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
