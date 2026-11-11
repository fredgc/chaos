// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get aboutButton => '关于';

  @override
  String get appTitle => '动力系统演示';

  @override
  String appVersionInfo(String name, String version, String buildNumber) {
    return '应用程序 $name 版本 $version.$buildNumber';
  }

  @override
  String get axisColorName => '坐标轴颜色';

  @override
  String get backgroundColorName => '背景颜色';

  @override
  String get cancelButton => '取消';

  @override
  String changeToolTooltip(String name, String tooltip) {
    return '$name：$tooltip\n点击切换工具。';
  }

  @override
  String get clearAllTooltip => '全部清除';

  @override
  String get closeButtonTooltip => '关闭';

  @override
  String colorPickerIndexedTitle(String name, int index) {
    return '选择 $name $index';
  }

  @override
  String get colorPickerTitle => '选择';

  @override
  String get controlsButton => '控制';

  @override
  String currentFieldTooltip(String title) {
    return '当前流场：$title\n点击切换';
  }

  @override
  String get doneButton => '完成';

  @override
  String get fieldChaos => '带有奇异吸引子的混沌系统';

  @override
  String get fieldRotate => '简单旋转';

  @override
  String get fieldSpiral => '稳定/不稳定点';

  @override
  String get fieldStir => '搅拌';

  @override
  String get fieldsButton => '流场';

  @override
  String get fpsThrottleName => '帧率限制';

  @override
  String get fpsThrottleTip => '帧率将被限制在此数值';

  @override
  String get helpTitle => '帮助';

  @override
  String get helpTooltip => '帮助';

  @override
  String get initializingApp => '正在初始化应用...';

  @override
  String get initializingSettings => '正在初始化设置...';

  @override
  String get isoclinesLabel => '等斜:';

  @override
  String get languageAuto => '自动';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get loadingText => '加载中...';

  @override
  String get moteColorsName => '微粒颜色';

  @override
  String get overviewButton => '概述';

  @override
  String parameterLabel(int number) {
    return '参数 $number：';
  }

  @override
  String get pauseTooltip => '暂停';

  @override
  String get periodicDebugLogsName => '定期调试日志';

  @override
  String get periodicDebugLogsTip => '在控制台中输出调试日志。';

  @override
  String get pickSpeedTooltip => '选择流速。';

  @override
  String get playTooltip => '播放';

  @override
  String get playbackSpeedName => '播放速度';

  @override
  String get privacyButton => '隐私';

  @override
  String get selectMoteColorTooltip => '选择微粒颜色';

  @override
  String get selectNextMoteColorTooltip => '选择下一颗微粒的颜色';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsTooltip => '设置';

  @override
  String get showIsoclinesTooltip => '显示等斜线';

  @override
  String get showVectorFieldTooltip => '显示矢量场';

  @override
  String get stillInitializing => '仍在初始化...';

  @override
  String get switchLanguageTooltip => '切换语言';

  @override
  String get termsButton => '条款';

  @override
  String get themeBrightnessLabel => '主题亮度：';

  @override
  String get themeColorName => '主题颜色';

  @override
  String get themeDark => '深色';

  @override
  String get themeLight => '浅色';

  @override
  String get themeSystem => '系统';

  @override
  String get toolAddName => '添加';

  @override
  String get toolAddTooltip => '点击向流场中添加一颗微粒';

  @override
  String get toolGridName => '网格';

  @override
  String get toolGridTooltip => '点击向流场中添加微粒网格';

  @override
  String get toolStreamName => '数据流';

  @override
  String get toolStreamTooltip => '点击向流场中添加连续微粒流';

  @override
  String get vectorFieldColorName => '矢量场';

  @override
  String get vectorFieldLabel => '场：';

  @override
  String get velocityScaleName => '速度比例';

  @override
  String get xIsoclineColorName => '等斜线颜色. X';

  @override
  String get yIsoclineColorName => 'Y';
}
