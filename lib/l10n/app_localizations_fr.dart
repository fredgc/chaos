// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get aboutButton => 'À propos';

  @override
  String get appTitle => 'Démo de système dynamique';

  @override
  String appVersionInfo(String name, String version, String buildNumber) {
    return 'Application $name version $version.$buildNumber';
  }

  @override
  String get axisColorName => 'Couleur des axes';

  @override
  String get backgroundColorName => 'Couleur d\'arrière-plan';

  @override
  String get cancelButton => 'Annuler';

  @override
  String changeToolTooltip(String name, String tooltip) {
    return '$name : $tooltip\nCliquez pour changer d\'outil.';
  }

  @override
  String get clearAllTooltip => 'Tout effacer';

  @override
  String get closeButtonTooltip => 'Fermer';

  @override
  String colorPickerIndexedTitle(String name, int index) {
    return 'Choisir $name $index';
  }

  @override
  String get colorPickerTitle => 'Choisir';

  @override
  String get controlsButton => 'Commandes';

  @override
  String currentFieldTooltip(String title) {
    return 'Champ vectoriel actuel : $title\nCliquez pour changer';
  }

  @override
  String get doneButton => 'Terminé';

  @override
  String get fieldChaos => 'Système chaotique avec attracteur étrange';

  @override
  String get fieldRotate => 'Rotation simple';

  @override
  String get fieldSpiral => 'Point stable/instable';

  @override
  String get fieldStir => 'Tourbillon';

  @override
  String get fieldsButton => 'Champs';

  @override
  String get fpsThrottleName => 'Limite de FPS';

  @override
  String get fpsThrottleTip =>
      'La fréquence d\'images sera limitée à cette valeur';

  @override
  String get helpTitle => 'Aide';

  @override
  String get helpTooltip => 'Aide';

  @override
  String get initializingApp => 'Initialisation de l\'application...';

  @override
  String get initializingSettings => 'Initialisation des paramètres...';

  @override
  String get isoclinesLabel => 'Iso :';

  @override
  String get languageAuto => 'Automatique';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get loadingText => 'Chargement...';

  @override
  String get moteColorsName => 'Couleurs des particules';

  @override
  String get overviewButton => 'Aperçu';

  @override
  String parameterLabel(int number) {
    return 'Paramètre $number : ';
  }

  @override
  String get pauseTooltip => 'Pause';

  @override
  String get periodicDebugLogsName => 'Journaux de débogage périodiques';

  @override
  String get periodicDebugLogsTip =>
      'Afficher des journaux de débogage dans la console.';

  @override
  String get pickSpeedTooltip => 'Choisir la vitesse du flux.';

  @override
  String get playTooltip => 'Lecture';

  @override
  String get playbackSpeedName => 'Vitesse de lecture';

  @override
  String get privacyButton => 'Confidentialité';

  @override
  String get selectMoteColorTooltip => 'Sélectionner la couleur des particules';

  @override
  String get selectNextMoteColorTooltip =>
      'Sélectionner la couleur de la prochaine particule';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsTooltip => 'Paramètres';

  @override
  String get showIsoclinesTooltip => 'Afficher les isoclines';

  @override
  String get showVectorFieldTooltip => 'Afficher le champ vectoriel';

  @override
  String get stillInitializing => 'Initialisation en cours...';

  @override
  String get switchLanguageTooltip => 'Changer de langue';

  @override
  String get termsButton => 'Conditions';

  @override
  String get themeBrightnessLabel => 'Luminosité du thème : ';

  @override
  String get themeColorName => 'Couleur du thème';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeSystem => 'Système';

  @override
  String get toolAddName => 'Ajouter';

  @override
  String get toolAddTooltip => 'Cliquez pour ajouter une particule au flux';

  @override
  String get toolGridName => 'Grille';

  @override
  String get toolGridTooltip =>
      'Cliquez pour ajouter une grille de particules au flux';

  @override
  String get toolStreamName => 'Flux continu';

  @override
  String get toolStreamTooltip =>
      'Cliquez pour ajouter un flux continu de particules';

  @override
  String get vectorFieldColorName => 'Champ vectoriel';

  @override
  String get vectorFieldLabel => 'Champ :';

  @override
  String get velocityScaleName => 'Échelle de vitesse';

  @override
  String get xIsoclineColorName => 'Couleurs des isoclines. X';

  @override
  String get yIsoclineColorName => 'Y';
}
