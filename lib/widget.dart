// Copyright 2024 Google LLC
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

import 'dart:async';
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart' show Vector2;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animate.dart';
import 'field.dart';
import 'flow.dart';
import 'help.dart';
import 'l10n/l10n_extension.dart';
import 'settings.dart';
import 'tool.dart';
import 'transform.dart';

enum SpeedLabel {
  very_slow("/10", 1.0 / 10.0),
  slow("/2", 1.0 / 2.0),
  normal("x1", 1.0),
  fast("x2", 2.0),
  very_fast("x4", 4.0);

  const SpeedLabel(this.label, this.multiplier);
  final String label;
  final double multiplier;
}

class FlowAppWidget extends StatefulWidget {
  FlowField flow;
  FieldEnum current_item;

  FlowAppWidget(this.flow, this.current_item) {
    print("YELLOW: Create new FlowAppWidget.");
  }

  @override
  State<FlowAppWidget> createState() => FlowAppWidgetState();
}

class FlowAppWidgetState extends State<FlowAppWidget>
    with SingleTickerProviderStateMixin {
  late StreamSubscription _statusListener;
  MyAnimator? animator; // Created in init state.

  Timer? debug_timer;
  int timer_counter = 0;
  static int flow_count = 0;
  int flow_number = 0;
  int build_count = 0;
  BoxConstraints _constraints = BoxConstraints();
  bool _narrow = false;

  static SavableDouble fps_throttle = SavableDouble(
      "fps_throttle", "FPS Throttle", 60.0,
      tip: "The frame rate will be throttled to this value");
  static SavableDouble speed = SavableDouble("speed", "Playback Speed", 1.0)
    ..visible = false;
  static SavableBool debug_logs = SavableBool(
      "debug_logs", "Periodic Debug Logs", false,
      tip: "Print some debug logs to the console.");

  static void initSettings(Settings settings) {
    settings.addTheme();
    FlowField.initSettings(settings);
    settings.add(fps_throttle);
    settings.add(speed);
    settings.add(EndOfRow());
    settings.add(debug_logs);
  }

  void updateSettings() {
    widget.flow.updateSettings();
    animator?.fps_throttle = fps_throttle.value;
  }

  @override
  void initState() {
    super.initState();
    print("RED: FlowAppWidget initState.");
    _statusListener = Settings.instance.statusStream().listen((status) {
      setState(() {
        // print("YELLOW: Widget setting state based on status $status");
        updateSettings();
      });
    });
    animator = MyAnimator(this, widget.flow, fps_throttle.value);
    // print("Settings speed = ${speed.value}");
    animator?.speed = speed.value;
    debug_timer = makeTimer();
  }

  Timer makeTimer() {
    flow_count++;
    flow_number = flow_count;
    return Timer.periodic(const Duration(seconds: 5), (timer) {
      if (debug_logs.value) {
        timer_counter++;
        print("T${flow_number} $timer_counter, b$build_count, " +
            widget.flow.debugPrint() +
            animator!.debugPrint());
      }
    });
  }

  @override
  void dispose() {
    print("RED: Displose of widget.");
    super.dispose();
    animator?.dispose();
    widget.flow.dispose();
    debug_timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    build_count++;
    // This happens on every state change, including slider updates.
    // print("YELLOW: FlowAppWidget build.");
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // If the constraints have changed, then we want to try the wide layout
      // again.  If not then keep the previous state of _narrow.
      if (constraints != _constraints) {
        // print("RED: constraints = ${constraints}");
        // print("RED: old =  ${_constraints}, _narrow = $_narrow");
        _narrow = false;
        _constraints = constraints;
        // } else {
        // print("BLUE: BoxConstraints ${constraints}. _narrow = $_narrow");
      }
      return Theme(
        data: Settings.instance.theme.theme_data,
        child: Scaffold(
          appBar: makeAppBar(context),
          body: Container(
            child: SafeArea(
              child: Center(
                child: _centerWidget(context),
              ),
            ),
          ),
        ),
      );
    });
  }

  AppBar makeAppBar(BuildContext context) {
    final settings_button = IconButton(
      onPressed: () {
        Navigator.pushNamed(context, SettingsScreen.routeName);
      },
      icon: const Icon(Icons.settings),
      tooltip: context.l10n.settingsTooltip,
    );

    return AppBar(
      title: _buildFlowMenu(context),
      leading: settings_button,
      actions: _getButtons(context),
    );
  }

  Widget _buildFlowMenu(BuildContext context) {
    return MenuAnchor(
        menuChildren: FieldEnum.values
            .map((f) => MenuItemButton(
                  child: Text(f.localizedTitle(context)),
                  onPressed: () {
                    if (f != widget.current_item) {
                      Navigator.pushNamed(context, f.route);
                    }
                  },
                ))
            .toList(),
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return TextButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            child: Tooltip(
              message: context.l10n.currentFieldTooltip(
                  widget.current_item.localizedTitle(context)),
              child: _flowTitle(context),
            ),
          );
        });
  }

  // Make a text widget that might be truncated. If the text is truncated, then
  // we want to switch to the narrow layout.
  Widget _flowTitle(BuildContext context) {
    final title = widget.current_item.localizedTitle(context);
    return LayoutBuilder(builder: (context, size) {
      var tp = TextPainter(
        maxLines: 1,
        textDirection: TextDirection.ltr,
        text: TextSpan(text: title),
      );
      tp.layout(maxWidth: size.maxWidth);
      var exceeded = tp.didExceedMaxLines;
      if (exceeded) {
        // print("YELLOW: '${widget.current_item.title}' Exceeded layout narrow=$_narrow.");
        if (!_narrow) {
          // Wait until this build/layout is finished and then try again with
          // a narrow layout.
          SchedulerBinding.instance.addPostFrameCallback((_) {
            // print("RED: post frame callback.");
            setState(() {
              // print("RED: switch to narrow.");
              _narrow = true;
            });
          });
        }
        // } else {
        //   print("GREEN: '${widget.current_item.title}' did not exceed layout.");
      }
      return Text(
        title,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
      );
    });
  }

  List<Widget> _getButtons(BuildContext context) {
    // print("Get buttons.");
    List<Widget> list = [];
    final isCompact = MediaQuery.sizeOf(context).width < 700;
    if (!_narrow && !isCompact) _getOtherButtons(list, context);
    list.add(_makeButton(context.l10n.helpTooltip, Icons.help, () {
      Navigator.pushNamed(context, HelpScreen.routeName);
    }));
    list.add(const LanguageSwitcherButton());
    return list;
  }

  void _getOtherButtons(List<Widget> list, BuildContext context) {
    list.add(_makeButton(context.l10n.clearAllTooltip, Icons.restart_alt, () {
      widget.flow.clearAll();
    }));
    list.add(_colorSelect(context));
    list.add(_pickTool(context));

    if (animator != null && animator!.isAnimating) {
      list.add(_makeButton(context.l10n.pauseTooltip, Icons.pause, () {
        setState(() {
          animator?.pause();
        });
      }));
    } else {
      list.add(_makeButton(context.l10n.playTooltip, Icons.play_arrow, () {
        setState(() {
          if (animator == null) return;
          animator?.play();
        });
      }));
    }
    list.add(_pickSpeed(context));
    list.add(_isoclineControl(context));
    list.add(_vectorFieldControl(context));
  }

  Widget _makeButton(String tip, IconData data, VoidCallback callback) {
    return IconButton(
      icon: Icon(data),
      tooltip: tip,
      onPressed: () {
        // setState(() {
        callback();
        // });
      },
    );
  }

  Widget _pickTool(BuildContext context) {
    final ToolItem current = widget.flow.current_tool;
    return MenuAnchor(
        menuChildren: ToolItem.values
            .map((tool) => MenuItemButton(
                  leadingIcon: Icon(tool.icon),
                  child: Text(tool.localizedName(context)),
                  onPressed: () {
                    if (tool != current) {
                      setState(() {
                        widget.flow.current_tool = tool;
                      });
                    }
                  },
                ))
            .toList(),
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return IconButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            tooltip: context.l10n.changeToolTooltip(
                current.localizedName(context),
                current.localizedTooltip(context)),
            icon: Icon(current.icon),
          );
        });
  }

  SpeedLabel _getSpeed() {
    double multiplier = speed.value;
    for (var s in SpeedLabel.values) {
      if ((s.multiplier - multiplier).abs() < 0.001) return s;
    }
    return SpeedLabel.normal;
  }

  Widget _pickSpeed(BuildContext context) {
    final SpeedLabel current = _getSpeed();
    return MenuAnchor(
        menuChildren: SpeedLabel.values
            .map((speed_label) => MenuItemButton(
                  child: Text(speed_label.label),
                  onPressed: () {
                    if (speed != current) {
                      setState(() {
                        animator?.speed = speed_label.multiplier;
                        speed.value = speed_label.multiplier;
                        Settings.instance.save();
                      });
                    }
                  },
                ))
            .toList(),
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return TextButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            child: Tooltip(
                message: context.l10n.pickSpeedTooltip,
                child: Text(
                  current.label,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                )),
          );
        });
  }

  Widget _isoclineControl(BuildContext context) {
    // Think about using this instead:
    // https://api.flutter.dev/flutter/material/SwitchListTile-class.html
    return Tooltip(
        message: context.l10n.showIsoclinesTooltip,
        child: Row(children: <Widget>[
          Text(context.l10n.isoclinesLabel),
          Checkbox(
              value: widget.flow.draw_isocline,
              onChanged: (bool? value) {
                setState(() {
                  widget.flow.draw_isocline = value!;
                });
              }),
        ]));
  }

  Widget _vectorFieldControl(BuildContext context) {
    return Tooltip(
        message: context.l10n.showVectorFieldTooltip,
        child: Row(children: <Widget>[
          Text(context.l10n.vectorFieldLabel),
          Checkbox(
              value: widget.flow.draw_field,
              onChanged: (bool? value) {
                setState(() {
                  widget.flow.draw_field = value!;
                });
              }),
        ]));
  }

  Widget _colorSelect(BuildContext context) {
    return Tooltip(
        message: context.l10n.selectMoteColorTooltip,
        child: MenuAnchor(
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              tooltip: context.l10n.selectNextMoteColorTooltip,
              icon: Icon(Icons.circle,
                  color: FlowField
                      .mote_colors.value[widget.flow.current_mote_color]),
            );
          },
          menuChildren: FlowField.mote_colors.value
              .asMap()
              .entries
              .map((entry) => MenuItemButton(
                    child: Icon(Icons.circle, color: entry.value),
                    onPressed: () {
                      setState(() {
                        widget.flow.current_mote_color = entry.key;
                      });
                    },
                  ))
              .toList(),
        ));
  }

  Widget _centerWidget(BuildContext context) {
    if (Settings.instance.status == SettingsStatus.NotInitialized) {
      Settings.instance.initialize(context);
      return Text(context.l10n.initializingSettings);
    }
    if (animator == null) {
      return Text(context.l10n.stillInitializing);
    }
    List<Widget> column = [];
    final isCompact = MediaQuery.sizeOf(context).width < 700;
    if (_narrow || isCompact) {
      List<Widget> list = [];
      _getOtherButtons(list, context);
      column.add(
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: list),
        ),
      );
    }
    column.add(Expanded(child: mainViewWidget(context)));
    for (int i = 0; i < widget.flow.field.parameter_count; i++) {
      column.add(Row(children: <Widget>[
        Text(context.l10n.parameterLabel(i + 1)),
        Expanded(
            child: Slider(
          value: widget.flow.field.getParameter(i),
          min: 0.0,
          max: 1.0,
          onChanged: (value) {
            setState(() {
              widget.flow.field.setParameter(i, value);
            });
          },
        )),
      ]));
    }
    return Column(children: column);
  }

  Widget mainViewWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Settings.instance.background_color,
        border: Border.all(
          width: 2.0,
          color: Settings.instance.theme.scheme.outline,
        ),
      ),
      child: ClipRect(child: widget.flow.build(context)),
    );
  }
}
