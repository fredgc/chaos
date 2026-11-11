// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get aboutButton => 'Apie';

  @override
  String get appTitle => 'Dinaminės sistemos demonstracija';

  @override
  String appVersionInfo(String name, String version, String buildNumber) {
    return 'Programa $name versija $version.$buildNumber';
  }

  @override
  String get axisColorName => 'Ašių spalva';

  @override
  String get backgroundColorName => 'Fono spalva';

  @override
  String get cancelButton => 'Atšaukti';

  @override
  String changeToolTooltip(String name, String tooltip) {
    return '$name: $tooltip\nSpustelėkite, norėdami pakeisti įrankį.';
  }

  @override
  String get clearAllTooltip => 'Išvalyti viską';

  @override
  String get closeButtonTooltip => 'Uždaryti';

  @override
  String colorPickerIndexedTitle(String name, int index) {
    return 'Pasirinkti $name $index';
  }

  @override
  String get colorPickerTitle => 'Pasirinkti';

  @override
  String get controlsButton => 'Valdikliai';

  @override
  String currentFieldTooltip(String title) {
    return 'Dabartinis srauto laukas: $title\nSpustelėkite, norėdami pakeisti';
  }

  @override
  String get doneButton => 'Atlikta';

  @override
  String get fieldChaos => 'Chaotinė sistema su keistuoju atraktoriumi';

  @override
  String get fieldRotate => 'Paprastas sukimasis';

  @override
  String get fieldSpiral => 'Stabilus / nestabilus taškas';

  @override
  String get fieldStir => 'Sūkurys';

  @override
  String get fieldsButton => 'Laukai';

  @override
  String get fpsThrottleName => 'Kadrų dažnio ribojimas (FPS)';

  @override
  String get fpsThrottleTip => 'Kadrų dažnis bus apribotas iki šios reikšmės';

  @override
  String get helpTitle => 'Pagalba';

  @override
  String get helpTooltip => 'Pagalba';

  @override
  String get initializingApp => 'Inicijuojama programa...';

  @override
  String get initializingSettings => 'Inicijuojami nustatymai...';

  @override
  String get isoclinesLabel => 'Izo:';

  @override
  String get languageAuto => 'Automatinis';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get loadingText => 'Įkeliama...';

  @override
  String get moteColorsName => 'Dalelių spalvos';

  @override
  String get overviewButton => 'Apžvalga';

  @override
  String parameterLabel(int number) {
    return 'Parametras $number: ';
  }

  @override
  String get pauseTooltip => 'Pauzė';

  @override
  String get periodicDebugLogsName => 'Periodiniai derinimo žurnalai';

  @override
  String get periodicDebugLogsTip => 'Spausdinti derinimo žurnalus konsolėje.';

  @override
  String get pickSpeedTooltip => 'Pasirinkti srauto greitį.';

  @override
  String get playTooltip => 'Paleisti';

  @override
  String get playbackSpeedName => 'Atkūrimo greitis';

  @override
  String get privacyButton => 'Privatumas';

  @override
  String get selectMoteColorTooltip => 'Pasirinkti dalelės spalvą';

  @override
  String get selectNextMoteColorTooltip => 'Pasirinkti kitos dalelės spalvą';

  @override
  String get settingsTitle => 'Nustatymai';

  @override
  String get settingsTooltip => 'Nustatymai';

  @override
  String get showIsoclinesTooltip => 'Rodyti izoklinas';

  @override
  String get showVectorFieldTooltip => 'Rodyti vektorinį lauką';

  @override
  String get stillInitializing => 'Vis dar inicijuojama...';

  @override
  String get switchLanguageTooltip => 'Keisti kalbą';

  @override
  String get termsButton => 'Sąlygos';

  @override
  String get themeBrightnessLabel => 'Temos šviesumas: ';

  @override
  String get themeColorName => 'Temos spalva';

  @override
  String get themeDark => 'Tamsi';

  @override
  String get themeLight => 'Šviesi';

  @override
  String get themeSystem => 'Sistemos';

  @override
  String get toolAddName => 'Pridėti';

  @override
  String get toolAddTooltip =>
      'Spustelėkite, norėdami pridėti vieną dalelę prie srauto';

  @override
  String get toolGridName => 'Tinklelis';

  @override
  String get toolGridTooltip =>
      'Spustelėkite, norėdami pridėti dalelių tinklelį prie srauto';

  @override
  String get toolStreamName => 'Srautas';

  @override
  String get toolStreamTooltip =>
      'Spustelėkite, norėdami pridėti dalelių srautą';

  @override
  String get vectorFieldColorName => 'Vektorinis laukas';

  @override
  String get vectorFieldLabel => 'Laukas:';

  @override
  String get velocityScaleName => 'Greičio mastelis';

  @override
  String get xIsoclineColorName => 'Izoklinų spalvos. X';

  @override
  String get yIsoclineColorName => 'Y';
}
