// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aboutButton => 'About';

  @override
  String get appTitle => 'Dynamic System Demo';

  @override
  String appVersionInfo(String name, String version, String buildNumber) {
    return 'Application $name version $version.$buildNumber';
  }

  @override
  String get axisColorName => 'Axis Color';

  @override
  String get backgroundColorName => 'Background Color';

  @override
  String get cancelButton => 'Cancel';

  @override
  String changeToolTooltip(String name, String tooltip) {
    return '$name: $tooltip\nClick to change tool.';
  }

  @override
  String get clearAllTooltip => 'Clear all';

  @override
  String get closeButtonTooltip => 'Close';

  @override
  String colorPickerIndexedTitle(String name, int index) {
    return 'Pick $name $index';
  }

  @override
  String get colorPickerTitle => 'Pick';

  @override
  String get controlsButton => 'Controls';

  @override
  String currentFieldTooltip(String title) {
    return 'Current flow field: $title\nClick to change';
  }

  @override
  String get doneButton => 'Done';

  @override
  String get fieldChaos => 'Chaotic System w/Strange Attractor';

  @override
  String get fieldRotate => 'Simple Rotation';

  @override
  String get fieldSpiral => 'Stable/Unstable Point';

  @override
  String get fieldStir => 'Stir';

  @override
  String get fieldsButton => 'Fields';

  @override
  String get fpsThrottleName => 'FPS Throttle';

  @override
  String get fpsThrottleTip => 'The frame rate will be throttled to this value';

  @override
  String get helpTitle => 'Help';

  @override
  String get helpTooltip => 'Help';

  @override
  String get initializingApp => 'Initializing App...';

  @override
  String get initializingSettings => 'Initializing Settings...';

  @override
  String get isoclinesLabel => 'Iso:';

  @override
  String get languageAuto => 'Auto';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get loadingText => 'Loading...';

  @override
  String get moteColorsName => 'Mote Colors';

  @override
  String get overviewButton => 'Overview';

  @override
  String parameterLabel(int number) {
    return 'Parameter $number: ';
  }

  @override
  String get pauseTooltip => 'Pause';

  @override
  String get periodicDebugLogsName => 'Periodic Debug Logs';

  @override
  String get periodicDebugLogsTip => 'Print some debug logs to the console.';

  @override
  String get pickSpeedTooltip => 'Pick flow speed.';

  @override
  String get playTooltip => 'Play';

  @override
  String get playbackSpeedName => 'Playback Speed';

  @override
  String get privacyButton => 'Privacy';

  @override
  String get selectMoteColorTooltip => 'Select mote color';

  @override
  String get selectNextMoteColorTooltip => 'Select color of next mote';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get showIsoclinesTooltip => 'Show isoclines';

  @override
  String get showVectorFieldTooltip => 'Show vector field';

  @override
  String get stillInitializing => 'Still Initializing...';

  @override
  String get switchLanguageTooltip => 'Switch language';

  @override
  String get termsButton => 'Terms';

  @override
  String get themeBrightnessLabel => 'Theme Brightness: ';

  @override
  String get themeColorName => 'Theme Color';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';

  @override
  String get themeSystem => 'System';

  @override
  String get toolAddName => 'Add';

  @override
  String get toolAddTooltip => 'Click to add one mote to the flow';

  @override
  String get toolGridName => 'Grid';

  @override
  String get toolGridTooltip => 'Click to add a grid of motes to the flow';

  @override
  String get toolStreamName => 'Stream';

  @override
  String get toolStreamTooltip => 'Click to add a stream of motes to the flow';

  @override
  String get vectorFieldColorName => 'Vector Field';

  @override
  String get vectorFieldLabel => 'Fld:';

  @override
  String get velocityScaleName => 'Velocity Scale';

  @override
  String get xIsoclineColorName => 'Isocline Colors. X';

  @override
  String get yIsoclineColorName => 'Y';
}
