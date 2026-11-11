// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get aboutButton => 'Über';

  @override
  String get appTitle => 'Dynamisches System Demo';

  @override
  String appVersionInfo(String name, String version, String buildNumber) {
    return 'Anwendung $name Version $version.$buildNumber';
  }

  @override
  String get axisColorName => 'Achsenfarbe';

  @override
  String get backgroundColorName => 'Hintergrundfarbe';

  @override
  String get cancelButton => 'Abbrechen';

  @override
  String changeToolTooltip(String name, String tooltip) {
    return '$name: $tooltip\nKlicken, um Werkzeug zu wechseln.';
  }

  @override
  String get clearAllTooltip => 'Alles löschen';

  @override
  String get closeButtonTooltip => 'Schließen';

  @override
  String colorPickerIndexedTitle(String name, int index) {
    return '$name $index auswählen';
  }

  @override
  String get colorPickerTitle => 'Auswählen';

  @override
  String get controlsButton => 'Steuerung';

  @override
  String currentFieldTooltip(String title) {
    return 'Aktuelles Strömungsfeld: $title\nKlicken zum Wechseln';
  }

  @override
  String get doneButton => 'Fertig';

  @override
  String get fieldChaos => 'Chaotisches System mit seltsamem Attraktor';

  @override
  String get fieldRotate => 'Einfache Rotation';

  @override
  String get fieldSpiral => 'Stabiler/Instabiler Punkt';

  @override
  String get fieldStir => 'Wirbel';

  @override
  String get fieldsButton => 'Felder';

  @override
  String get fpsThrottleName => 'FPS-Drosselung';

  @override
  String get fpsThrottleTip => 'Die Bildrate wird auf diesen Wert gedrosselt';

  @override
  String get helpTitle => 'Hilfe';

  @override
  String get helpTooltip => 'Hilfe';

  @override
  String get initializingApp => 'App wird initialisiert...';

  @override
  String get initializingSettings => 'Einstellungen werden initialisiert...';

  @override
  String get isoclinesLabel => 'Iso:';

  @override
  String get languageAuto => 'Automatisch';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get loadingText => 'Wird geladen...';

  @override
  String get moteColorsName => 'Partikelfarben';

  @override
  String get overviewButton => 'Übersicht';

  @override
  String parameterLabel(int number) {
    return 'Parameter $number: ';
  }

  @override
  String get pauseTooltip => 'Pause';

  @override
  String get periodicDebugLogsName => 'Regelmäßige Debug-Protokolle';

  @override
  String get periodicDebugLogsTip =>
      'Einige Debug-Protokolle in der Konsole ausgeben.';

  @override
  String get pickSpeedTooltip => 'Strömungsgeschwindigkeit wählen.';

  @override
  String get playTooltip => 'Abspielen';

  @override
  String get playbackSpeedName => 'Wiedergabegeschwindigkeit';

  @override
  String get privacyButton => 'Datenschutz';

  @override
  String get selectMoteColorTooltip => 'Partikelfarbe auswählen';

  @override
  String get selectNextMoteColorTooltip =>
      'Farbe der nächsten Partikel auswählen';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsTooltip => 'Einstellungen';

  @override
  String get showIsoclinesTooltip => 'Isoklinen anzeigen';

  @override
  String get showVectorFieldTooltip => 'Vektorfeld anzeigen';

  @override
  String get stillInitializing => 'Wird noch initialisiert...';

  @override
  String get switchLanguageTooltip => 'Sprache wechseln';

  @override
  String get termsButton => 'Bedingungen';

  @override
  String get themeBrightnessLabel => 'Thema-Helligkeit: ';

  @override
  String get themeColorName => 'Themenfarbe';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeSystem => 'System';

  @override
  String get toolAddName => 'Hinzufügen';

  @override
  String get toolAddTooltip =>
      'Klicken, um ein Partikel zur Strömung hinzuzufügen';

  @override
  String get toolGridName => 'Gitter';

  @override
  String get toolGridTooltip =>
      'Klicken, um ein Partikelgitter zur Strömung hinzuzufügen';

  @override
  String get toolStreamName => 'Strom';

  @override
  String get toolStreamTooltip =>
      'Klicken, um einen Partikelstrom zur Strömung hinzuzufügen';

  @override
  String get vectorFieldColorName => 'Vektorfeld';

  @override
  String get vectorFieldLabel => 'Feld:';

  @override
  String get velocityScaleName => 'Geschwindigkeitsskalierung';

  @override
  String get xIsoclineColorName => 'Isoklinenfarben. X';

  @override
  String get yIsoclineColorName => 'Y';
}
