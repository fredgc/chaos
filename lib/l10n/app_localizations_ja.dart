// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get aboutButton => '情報';

  @override
  String get appTitle => '動的システムデモ';

  @override
  String appVersionInfo(String name, String version, String buildNumber) {
    return 'アプリケーション $name バージョン $version.$buildNumber';
  }

  @override
  String get axisColorName => '軸の色';

  @override
  String get backgroundColorName => '背景色';

  @override
  String get cancelButton => 'キャンセル';

  @override
  String changeToolTooltip(String name, String tooltip) {
    return '$name: $tooltip\nクリックしてツールを変更。';
  }

  @override
  String get clearAllTooltip => 'すべてクリア';

  @override
  String get closeButtonTooltip => '閉じる';

  @override
  String colorPickerIndexedTitle(String name, int index) {
    return '$name $index を選択';
  }

  @override
  String get colorPickerTitle => '選択';

  @override
  String get controlsButton => '操作方法';

  @override
  String currentFieldTooltip(String title) {
    return '現在の流動場: $title\nクリックして変更';
  }

  @override
  String get doneButton => '完了';

  @override
  String get fieldChaos => 'ストレンジアトラクターを持つカオス系';

  @override
  String get fieldRotate => '単純回転';

  @override
  String get fieldSpiral => '安定/不安定点';

  @override
  String get fieldStir => '攪拌';

  @override
  String get fieldsButton => '場';

  @override
  String get fpsThrottleName => 'FPS制限';

  @override
  String get fpsThrottleTip => 'フレームレートはこの値に制限されます';

  @override
  String get helpTitle => 'ヘルプ';

  @override
  String get helpTooltip => 'ヘルプ';

  @override
  String get initializingApp => 'アプリを初期化中...';

  @override
  String get initializingSettings => '設定を初期化中...';

  @override
  String get isoclinesLabel => '等傾:';

  @override
  String get languageAuto => '自動';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get loadingText => '読み込み中...';

  @override
  String get moteColorsName => '粒子の色';

  @override
  String get overviewButton => '概要';

  @override
  String parameterLabel(int number) {
    return 'パラメータ $number: ';
  }

  @override
  String get pauseTooltip => '一時停止';

  @override
  String get periodicDebugLogsName => '定期デバッグログ';

  @override
  String get periodicDebugLogsTip => 'コンソールにデバッグログを出力します。';

  @override
  String get pickSpeedTooltip => '流速を選択。';

  @override
  String get playTooltip => '再生';

  @override
  String get playbackSpeedName => '再生速度';

  @override
  String get privacyButton => 'プライバシー';

  @override
  String get selectMoteColorTooltip => '粒子の色を選択';

  @override
  String get selectNextMoteColorTooltip => '次の粒子の色を選択';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsTooltip => '設定';

  @override
  String get showIsoclinesTooltip => '等傾線を表示';

  @override
  String get showVectorFieldTooltip => 'ベクトル場を表示';

  @override
  String get stillInitializing => '初期化中...';

  @override
  String get switchLanguageTooltip => '言語を切り替える';

  @override
  String get termsButton => '利用規約';

  @override
  String get themeBrightnessLabel => 'テーマの明るさ: ';

  @override
  String get themeColorName => 'テーマカラー';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeSystem => 'システム';

  @override
  String get toolAddName => '追加';

  @override
  String get toolAddTooltip => 'クリックして流れに粒子を1つ追加';

  @override
  String get toolGridName => 'グリッド';

  @override
  String get toolGridTooltip => 'クリックして流れに粒子のグリッドを追加';

  @override
  String get toolStreamName => 'ストリーム';

  @override
  String get toolStreamTooltip => 'クリックして流れに粒子のストリームを追加';

  @override
  String get vectorFieldColorName => 'ベクトル場';

  @override
  String get vectorFieldLabel => '場:';

  @override
  String get velocityScaleName => '速度スケール';

  @override
  String get xIsoclineColorName => '等傾線の色. X';

  @override
  String get yIsoclineColorName => 'Y';
}
