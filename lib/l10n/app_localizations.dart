import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ja'),
    Locale('lt'),
    Locale('pt'),
    Locale('zh')
  ];

  /// Button to open About help document
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutButton;

  /// Title displayed on application header
  ///
  /// In en, this message translates to:
  /// **'Dynamic System Demo'**
  String get appTitle;

  /// Application version information in settings
  ///
  /// In en, this message translates to:
  /// **'Application {name} version {version}.{buildNumber}'**
  String appVersionInfo(String name, String version, String buildNumber);

  /// Setting name for plot axis color
  ///
  /// In en, this message translates to:
  /// **'Axis Color'**
  String get axisColorName;

  /// Setting name for background color
  ///
  /// In en, this message translates to:
  /// **'Background Color'**
  String get backgroundColorName;

  /// Button to cancel settings changes
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// Tooltip on the tool picker button
  ///
  /// In en, this message translates to:
  /// **'{name}: {tooltip}\nClick to change tool.'**
  String changeToolTooltip(String name, String tooltip);

  /// Tooltip for clear all motes button
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAllTooltip;

  /// Tooltip for close dialog button
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeButtonTooltip;

  /// Title in color picker dialog for indexed color
  ///
  /// In en, this message translates to:
  /// **'Pick {name} {index}'**
  String colorPickerIndexedTitle(String name, int index);

  /// Title in color picker dialog
  ///
  /// In en, this message translates to:
  /// **'Pick'**
  String get colorPickerTitle;

  /// Button to open Controls help document
  ///
  /// In en, this message translates to:
  /// **'Controls'**
  String get controlsButton;

  /// Tooltip for current flow field menu button
  ///
  /// In en, this message translates to:
  /// **'Current flow field: {title}\nClick to change'**
  String currentFieldTooltip(String title);

  /// Button to save and apply settings
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneButton;

  /// Name of the chaotic system field
  ///
  /// In en, this message translates to:
  /// **'Chaotic System w/Strange Attractor'**
  String get fieldChaos;

  /// Name of the simple rotation field
  ///
  /// In en, this message translates to:
  /// **'Simple Rotation'**
  String get fieldRotate;

  /// Name of the spiral field
  ///
  /// In en, this message translates to:
  /// **'Stable/Unstable Point'**
  String get fieldSpiral;

  /// Name of the stir field
  ///
  /// In en, this message translates to:
  /// **'Stir'**
  String get fieldStir;

  /// Button to open Fields help document
  ///
  /// In en, this message translates to:
  /// **'Fields'**
  String get fieldsButton;

  /// Setting name for FPS throttle
  ///
  /// In en, this message translates to:
  /// **'FPS Throttle'**
  String get fpsThrottleName;

  /// Tooltip for FPS throttle setting
  ///
  /// In en, this message translates to:
  /// **'The frame rate will be throttled to this value'**
  String get fpsThrottleTip;

  /// Title of the Help screen
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get helpTitle;

  /// Tooltip for help button
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get helpTooltip;

  /// Message shown while app is initializing
  ///
  /// In en, this message translates to:
  /// **'Initializing App...'**
  String get initializingApp;

  /// Message shown while settings are initializing
  ///
  /// In en, this message translates to:
  /// **'Initializing Settings...'**
  String get initializingSettings;

  /// Label for isocline toggle checkbox
  ///
  /// In en, this message translates to:
  /// **'Iso:'**
  String get isoclinesLabel;

  /// Option to follow system language
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get languageAuto;

  /// Option for English language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// Option for Spanish language
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get languageSpanish;

  /// Text displayed while document is loading
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loadingText;

  /// Setting name for mote colors
  ///
  /// In en, this message translates to:
  /// **'Mote Colors'**
  String get moteColorsName;

  /// Button to open Overview help document
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overviewButton;

  /// Label for dynamic system parameter slider
  ///
  /// In en, this message translates to:
  /// **'Parameter {number}: '**
  String parameterLabel(int number);

  /// Tooltip for pause button
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pauseTooltip;

  /// Setting name for periodic debug logs
  ///
  /// In en, this message translates to:
  /// **'Periodic Debug Logs'**
  String get periodicDebugLogsName;

  /// Tooltip for periodic debug logs setting
  ///
  /// In en, this message translates to:
  /// **'Print some debug logs to the console.'**
  String get periodicDebugLogsTip;

  /// Tooltip for speed picker
  ///
  /// In en, this message translates to:
  /// **'Pick flow speed.'**
  String get pickSpeedTooltip;

  /// Tooltip for play button
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get playTooltip;

  /// Setting name for playback speed
  ///
  /// In en, this message translates to:
  /// **'Playback Speed'**
  String get playbackSpeedName;

  /// Button to open Privacy help document
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyButton;

  /// Tooltip for mote color selector container
  ///
  /// In en, this message translates to:
  /// **'Select mote color'**
  String get selectMoteColorTooltip;

  /// Tooltip for button to select next mote color
  ///
  /// In en, this message translates to:
  /// **'Select color of next mote'**
  String get selectNextMoteColorTooltip;

  /// Title of settings screen and button tooltip
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Tooltip for settings button
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTooltip;

  /// Tooltip for isoclines checkbox
  ///
  /// In en, this message translates to:
  /// **'Show isoclines'**
  String get showIsoclinesTooltip;

  /// Tooltip for vector field checkbox
  ///
  /// In en, this message translates to:
  /// **'Show vector field'**
  String get showVectorFieldTooltip;

  /// Message shown while animator is initializing
  ///
  /// In en, this message translates to:
  /// **'Still Initializing...'**
  String get stillInitializing;

  /// Tooltip for the language selection menu button
  ///
  /// In en, this message translates to:
  /// **'Switch language'**
  String get switchLanguageTooltip;

  /// Button to open Terms help document
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get termsButton;

  /// Label for theme brightness toggle
  ///
  /// In en, this message translates to:
  /// **'Theme Brightness: '**
  String get themeBrightnessLabel;

  /// Setting name for theme color
  ///
  /// In en, this message translates to:
  /// **'Theme Color'**
  String get themeColorName;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// System theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// Name of the Add tool
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get toolAddName;

  /// Tooltip of the Add tool
  ///
  /// In en, this message translates to:
  /// **'Click to add one mote to the flow'**
  String get toolAddTooltip;

  /// Name of the Grid tool
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get toolGridName;

  /// Tooltip of the Grid tool
  ///
  /// In en, this message translates to:
  /// **'Click to add a grid of motes to the flow'**
  String get toolGridTooltip;

  /// Name of the Stream tool
  ///
  /// In en, this message translates to:
  /// **'Stream'**
  String get toolStreamName;

  /// Tooltip of the Stream tool
  ///
  /// In en, this message translates to:
  /// **'Click to add a stream of motes to the flow'**
  String get toolStreamTooltip;

  /// Setting name for vector field color
  ///
  /// In en, this message translates to:
  /// **'Vector Field'**
  String get vectorFieldColorName;

  /// Label for vector field toggle checkbox
  ///
  /// In en, this message translates to:
  /// **'Fld:'**
  String get vectorFieldLabel;

  /// Setting name for velocity scale
  ///
  /// In en, this message translates to:
  /// **'Velocity Scale'**
  String get velocityScaleName;

  /// Setting name for X isocline color
  ///
  /// In en, this message translates to:
  /// **'Isocline Colors. X'**
  String get xIsoclineColorName;

  /// Setting name for Y isocline color
  ///
  /// In en, this message translates to:
  /// **'Y'**
  String get yIsoclineColorName;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'ja',
        'lt',
        'pt',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ja':
      return AppLocalizationsJa();
    case 'lt':
      return AppLocalizationsLt();
    case 'pt':
      return AppLocalizationsPt();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
