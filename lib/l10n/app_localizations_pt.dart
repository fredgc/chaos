// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get aboutButton => 'Sobre';

  @override
  String get appTitle => 'Demonstração de Sistemas Dinâmicos';

  @override
  String appVersionInfo(String name, String version, String buildNumber) {
    return 'Aplicativo $name versão $version.$buildNumber';
  }

  @override
  String get axisColorName => 'Cor dos eixos';

  @override
  String get backgroundColorName => 'Cor de fundo';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String changeToolTooltip(String name, String tooltip) {
    return '$name: $tooltip\nClique para mudar de ferramenta.';
  }

  @override
  String get clearAllTooltip => 'Limpar tudo';

  @override
  String get closeButtonTooltip => 'Fechar';

  @override
  String colorPickerIndexedTitle(String name, int index) {
    return 'Escolher $name $index';
  }

  @override
  String get colorPickerTitle => 'Escolher';

  @override
  String get controlsButton => 'Controles';

  @override
  String currentFieldTooltip(String title) {
    return 'Campo de fluxo atual: $title\nClique para alterar';
  }

  @override
  String get doneButton => 'Concluído';

  @override
  String get fieldChaos => 'Sistema caótico com atrator estranho';

  @override
  String get fieldRotate => 'Rotação simples';

  @override
  String get fieldSpiral => 'Ponto estável/instável';

  @override
  String get fieldStir => 'Agitação';

  @override
  String get fieldsButton => 'Campos';

  @override
  String get fpsThrottleName => 'Limite de FPS';

  @override
  String get fpsThrottleTip => 'A taxa de quadros será limitada a este valor';

  @override
  String get helpTitle => 'Ajuda';

  @override
  String get helpTooltip => 'Ajuda';

  @override
  String get initializingApp => 'Inicializando aplicativo...';

  @override
  String get initializingSettings => 'Inicializando configurações...';

  @override
  String get isoclinesLabel => 'Iso:';

  @override
  String get languageAuto => 'Automático';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get loadingText => 'Carregando...';

  @override
  String get moteColorsName => 'Cores das partículas';

  @override
  String get overviewButton => 'Visão Geral';

  @override
  String parameterLabel(int number) {
    return 'Parâmetro $number: ';
  }

  @override
  String get pauseTooltip => 'Pausar';

  @override
  String get periodicDebugLogsName => 'Logs periódicos de depuração';

  @override
  String get periodicDebugLogsTip => 'Imprimir logs de depuração no console.';

  @override
  String get pickSpeedTooltip => 'Escolher a velocidade do fluxo.';

  @override
  String get playTooltip => 'Reproduzir';

  @override
  String get playbackSpeedName => 'Velocidade de reprodução';

  @override
  String get privacyButton => 'Privacidade';

  @override
  String get selectMoteColorTooltip => 'Selecionar cor da partícula';

  @override
  String get selectNextMoteColorTooltip =>
      'Selecionar cor da próxima partícula';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get settingsTooltip => 'Configurações';

  @override
  String get showIsoclinesTooltip => 'Mostrar isóclinas';

  @override
  String get showVectorFieldTooltip => 'Mostrar campo vetorial';

  @override
  String get stillInitializing => 'Ainda inicializando...';

  @override
  String get switchLanguageTooltip => 'Alterar idioma';

  @override
  String get termsButton => 'Termos';

  @override
  String get themeBrightnessLabel => 'Brilho do tema: ';

  @override
  String get themeColorName => 'Cor do tema';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get toolAddName => 'Adicionar';

  @override
  String get toolAddTooltip => 'Clique para adicionar uma partícula ao fluxo';

  @override
  String get toolGridName => 'Grade';

  @override
  String get toolGridTooltip =>
      'Clique para adicionar uma grade de partículas ao fluxo';

  @override
  String get toolStreamName => 'Fluxo';

  @override
  String get toolStreamTooltip =>
      'Clique para adicionar um fluxo de partículas';

  @override
  String get vectorFieldColorName => 'Campo vetorial';

  @override
  String get vectorFieldLabel => 'Campo:';

  @override
  String get velocityScaleName => 'Escala de velocidade';

  @override
  String get xIsoclineColorName => 'Cores das isóclinas. X';

  @override
  String get yIsoclineColorName => 'Y';
}
