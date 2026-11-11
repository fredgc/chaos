// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get aboutButton => 'Acerca de';

  @override
  String get appTitle => 'Demostración de Sistemas Dinámicos';

  @override
  String appVersionInfo(String name, String version, String buildNumber) {
    return 'Aplicación $name versión $version.$buildNumber';
  }

  @override
  String get axisColorName => 'Color de los ejes';

  @override
  String get backgroundColorName => 'Color de fondo';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String changeToolTooltip(String name, String tooltip) {
    return '$name: $tooltip\nHaga clic para cambiar de herramienta.';
  }

  @override
  String get clearAllTooltip => 'Borrar todo';

  @override
  String get closeButtonTooltip => 'Cerrar';

  @override
  String colorPickerIndexedTitle(String name, int index) {
    return 'Elegir $name $index';
  }

  @override
  String get colorPickerTitle => 'Elegir';

  @override
  String get controlsButton => 'Controles';

  @override
  String currentFieldTooltip(String title) {
    return 'Campo de flujo actual: $title\nHaga clic para cambiar';
  }

  @override
  String get doneButton => 'Listo';

  @override
  String get fieldChaos => 'Sistema caótico con atractor extraño';

  @override
  String get fieldRotate => 'Rotación simple';

  @override
  String get fieldSpiral => 'Punto estable/inestable';

  @override
  String get fieldStir => 'Remolino';

  @override
  String get fieldsButton => 'Campos';

  @override
  String get fpsThrottleName => 'Límite de FPS';

  @override
  String get fpsThrottleTip => 'La tasa de fotogramas se limitará a este valor';

  @override
  String get helpTitle => 'Ayuda';

  @override
  String get helpTooltip => 'Ayuda';

  @override
  String get initializingApp => 'Inicializando aplicación...';

  @override
  String get initializingSettings => 'Inicializando configuración...';

  @override
  String get isoclinesLabel => 'Iso:';

  @override
  String get languageAuto => 'Automático';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get loadingText => 'Cargando...';

  @override
  String get moteColorsName => 'Colores de motas';

  @override
  String get overviewButton => 'Resumen';

  @override
  String parameterLabel(int number) {
    return 'Parámetro $number: ';
  }

  @override
  String get pauseTooltip => 'Pausar';

  @override
  String get periodicDebugLogsName => 'Registros periódicos de depuración';

  @override
  String get periodicDebugLogsTip =>
      'Imprimir registros de depuración en la consola.';

  @override
  String get pickSpeedTooltip => 'Elegir velocidad de flujo.';

  @override
  String get playTooltip => 'Reproducir';

  @override
  String get playbackSpeedName => 'Velocidad de reproducción';

  @override
  String get privacyButton => 'Privacidad';

  @override
  String get selectMoteColorTooltip => 'Seleccionar color de mota';

  @override
  String get selectNextMoteColorTooltip =>
      'Seleccionar color de la siguiente mota';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get settingsTooltip => 'Configuración';

  @override
  String get showIsoclinesTooltip => 'Mostrar isoclinas';

  @override
  String get showVectorFieldTooltip => 'Mostrar campo vectorial';

  @override
  String get stillInitializing => 'Aún inicializando...';

  @override
  String get switchLanguageTooltip => 'Cambiar idioma';

  @override
  String get termsButton => 'Términos';

  @override
  String get themeBrightnessLabel => 'Brillo del tema: ';

  @override
  String get themeColorName => 'Color del tema';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get toolAddName => 'Añadir';

  @override
  String get toolAddTooltip => 'Haga clic para añadir una mota al flujo';

  @override
  String get toolGridName => 'Cuadrícula';

  @override
  String get toolGridTooltip =>
      'Haga clic para añadir una cuadrícula de motas al flujo';

  @override
  String get toolStreamName => 'Corriente';

  @override
  String get toolStreamTooltip =>
      'Haga clic para añadir una corriente de motas al flujo';

  @override
  String get vectorFieldColorName => 'Campo vectorial';

  @override
  String get vectorFieldLabel => 'Campo:';

  @override
  String get velocityScaleName => 'Escala de velocidad';

  @override
  String get xIsoclineColorName => 'Colores de isoclinas. X';

  @override
  String get yIsoclineColorName => 'Y';
}
