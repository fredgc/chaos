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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chaos/help.dart';
import 'package:chaos/help_nav_listener.dart';
import 'package:chaos/l10n/l10n_extension.dart';
import 'package:chaos/main.dart';
import 'package:chaos/widget.dart';
import 'package:chaos/settings.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('App smoke test', (WidgetTester tester) async {
    final builder = MyAppBuilder();
    FlowAppWidgetState.initSettings(Settings.instance);
    await tester.pumpWidget(builder.makeApp());
    await tester.pump();
    expect(find.byType(FlowAppWidget), findsOneWidget);
  });

  testWidgets('App renders in English by default', (WidgetTester tester) async {
    LocaleController.currentLocale.value = const Locale('en');
    final builder = MyAppBuilder();
    FlowAppWidgetState.initSettings(Settings.instance);
    await tester.pumpWidget(builder.makeApp());
    await tester.pump();
    expect(find.text('Simple Rotation'), findsOneWidget);
    expect(find.byType(LanguageSwitcherButton), findsOneWidget);
    expect(find.byTooltip('Help'), findsOneWidget);
    expect(find.byTooltip('Settings'), findsOneWidget);
  });

  testWidgets('App renders in Spanish when locale is set to es',
      (WidgetTester tester) async {
    LocaleController.currentLocale.value = const Locale('es');
    final builder = MyAppBuilder();
    FlowAppWidgetState.initSettings(Settings.instance);
    await tester.pumpWidget(builder.makeApp());
    await tester.pump();
    expect(find.text('Rotación simple'), findsOneWidget);
    expect(find.byType(LanguageSwitcherButton), findsOneWidget);
    expect(find.byTooltip('Ayuda'), findsOneWidget);
    expect(find.byTooltip('Configuración'), findsOneWidget);
  });

  test('All supported locales have valid translations', () {
    for (final locale in LocaleController.supportedLocales) {
      final l10n = lookupAppLocalizations(locale);
      expect(l10n.appTitle.isNotEmpty, isTrue);
      expect(l10n.switchLanguageTooltip.isNotEmpty, isTrue);
      expect(l10n.fieldRotate.isNotEmpty, isTrue);
    }
  });

  test('All localized ARB files maintain key parity with app_en.arb', () {
    final enContent = File('lib/l10n/app_en.arb').readAsStringSync();
    final enJson = jsonDecode(enContent) as Map<String, dynamic>;
    final enKeys = enJson.keys.where((k) => !k.startsWith('@')).toSet();

    final targetArbFiles = [
      'app_de.arb',
      'app_es.arb',
      'app_fr.arb',
      'app_ja.arb',
      'app_lt.arb',
      'app_pt.arb',
      'app_zh.arb',
    ];

    for (final file in targetArbFiles) {
      final content = File('lib/l10n/$file').readAsStringSync();
      final json = jsonDecode(content) as Map<String, dynamic>;
      for (final key in enKeys) {
        expect(
          json.containsKey(key),
          isTrue,
          reason: 'ARB file $file is missing key "$key"',
        );
      }
    }
  });

  test('Help navigation target parsing and external URL detection', () {
    expect(HelpScreen.isExternalUrl('https://example.com'), isTrue);
    expect(HelpScreen.isExternalUrl('http://example.com/page'), isTrue);
    expect(HelpScreen.isExternalUrl('mailto:user@example.com'), isTrue);
    expect(HelpScreen.isExternalUrl('fields.html'), isFalse);
    expect(HelpScreen.isExternalUrl('controls.html'), isFalse);
    expect(HelpScreen.isExternalUrl('./help_es.html'), isFalse);

    expect(HelpScreen.cleanNavTarget('fields.html'), 'fields.html');
    expect(HelpScreen.cleanNavTarget('./fields.html'), 'fields.html');
    expect(
        HelpScreen.cleanNavTarget('controls.html#section1'), 'controls.html');
    expect(HelpScreen.cleanNavTarget('help_es.html?ref=1'), 'help_es.html');
  });

  test('HelpNavListener initializes and disposes cleanly', () {
    String? navigated;
    final listener = HelpNavListener((href) {
      navigated = href;
    });
    expect(navigated, isNull);
    listener.dispose();
  });
}
