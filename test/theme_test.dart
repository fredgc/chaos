// Copyright 2026 Google LLC
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

import 'package:chaos/color.dart';
import 'package:chaos/l10n/l10n_extension.dart';
import 'package:chaos/main.dart';
import 'package:chaos/settings.dart';
import 'package:chaos/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakePrefs implements SharedPreferencesWithCache {
  final Map<String, Object?> _data;
  _FakePrefs(this._data);

  @override
  int? getInt(String key) => _data[key] as int?;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('Theme cleanup tests', () {
    testWidgets('FlowAppWidget reflects dark theme',
        (WidgetTester tester) async {
      final settings = Settings.instance;
      FlowAppWidgetState.initSettings(settings);
      settings.theme.theme_mode = ThemeMode.dark;
      settings.theme.update();

      final builder = MyAppBuilder();
      await tester.pumpWidget(builder.makeApp());
      await tester.pump();

      final scaffoldFinder = find.byType(Scaffold);
      expect(scaffoldFinder, findsOneWidget);

      final expectedSurface = ColorScheme.fromSeed(
        seedColor: settings.theme.theme_color.value,
        brightness: Brightness.dark,
      ).surface;
      final theme = Theme.of(tester.element(scaffoldFinder));
      expect(theme.brightness, Brightness.dark);
      expect(theme.colorScheme.surface, expectedSurface);
      expect(theme.scaffoldBackgroundColor, expectedSurface);
    });

    testWidgets(
        'SettingsScreen reflects dark theme and elevatedButtonTheme contrast',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1280, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final settings = Settings.instance;
      FlowAppWidgetState.initSettings(settings);
      settings.status = SettingsStatus.Initialized;
      settings.theme.theme_mode = ThemeMode.dark;
      settings.theme.update();

      await tester.pumpWidget(
        MaterialApp(
          theme: settings.theme.theme_data,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: SettingsScreen(),
        ),
      );
      await tester.pump();

      final scaffoldFinder = find.byType(Scaffold);
      expect(scaffoldFinder, findsOneWidget);

      final expectedSurface = ColorScheme.fromSeed(
        seedColor: settings.theme.theme_color.value,
        brightness: Brightness.dark,
      ).surface;
      final theme = Theme.of(tester.element(scaffoldFinder));
      expect(theme.brightness, Brightness.dark);
      expect(theme.colorScheme.surface, expectedSurface);
      expect(theme.scaffoldBackgroundColor, expectedSurface);

      final buttonStyle = theme.elevatedButtonTheme.style!;
      expect(
        buttonStyle.backgroundColor?.resolve({}),
        theme.colorScheme.primaryContainer,
      );
      expect(
        buttonStyle.foregroundColor?.resolve({}),
        theme.colorScheme.onPrimaryContainer,
      );
    });

    test('SavableTheme.load preserves saved background_color', () {
      const customBg = Color(0xFF112233);
      final prefs = _FakePrefs({
        'theme_mode': ThemeMode.dark.index,
        'theme_color': Colors.teal.toARGB32(),
        'backgroud_color': customBg.toARGB32(),
      });

      final theme = SavableTheme();
      theme.load(prefs);

      expect(theme.theme_mode, ThemeMode.dark);
      expect(theme.theme_color.value.toARGB32(), Colors.teal.toARGB32());
      expect(theme.background_color.value, customBg);
      expect(theme.theme_color.reset(theme.scheme), theme.scheme.primary);
      expect(theme.background_color.reset(theme.scheme), theme.scheme.surface);
    });
  });
}
