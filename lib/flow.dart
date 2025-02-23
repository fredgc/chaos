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

import 'dart:math' as math;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show Vector2;

import 'axis.dart';
import 'color.dart';
import 'field.dart';
import 'mote.dart';
import 'printer.dart';
import 'settings.dart';
import 'tool.dart';
import 'transform.dart';

class MotePainter extends CustomPainter {
  FlowField flow;
  MotePainter({required this.flow, repaint}) : super(repaint: repaint);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    bool should = (this != oldDelegate);
    return should;
  }

  @override
  void paint(Canvas canvas, Size size) {
    flow.paint(canvas, size);
  }
}

class FlowField {
  FieldEnum item;
  VectorField field;
  int current_mote_color = 0;
  ToolItem current_tool = ToolItem.add;
  CoordinateTransform transform = CoordinateTransform();
  PlotAxis x_axis = PlotAxis(vertical: false);
  PlotAxis y_axis = PlotAxis(vertical: true);
  List<Mote> motes = [];
  MoteStreamList streams = MoteStreamList();
  ValueNotifier<int> repaint_counter = ValueNotifier<int>(0);
  double time = 0;
  double max_dt = -100;
  double min_dt = 100;
  bool draw_isocline = false;
  bool draw_field = false;

  static SavableDouble velocity_scale =
      SavableDouble("velocity_scale", "Velocity Scale", 0.02);
  static SavableColor axis_color = SavableColor(
      "axis_color", "Axis Color", Colors.white, (scheme) => scheme.onSurface);
  static SavableColor x_isocline_color = SavableColor("x_isocline_color",
      "Isocline Colors. X", Colors.yellow, (scheme) => scheme.secondary);
  static SavableColor y_isocline_color = SavableColor(
      "y_isocline_color", "Y", Colors.yellow, (scheme) => scheme.tertiary);
  static SavableColor feather_color = SavableColor("feather_color",
      "Vector Field", Colors.yellow, (scheme) => scheme.tertiary);
  static final List<Color> mote_dark = [
    Colors.blue.shade500,
    Colors.green.shade500,
    Colors.red.shade500,
    Colors.teal.shade500,
  ];
  static final List<Color> mote_light = [
    Colors.blue.shade500,
    Colors.green.shade500,
    Colors.red.shade500,
    Colors.teal.shade500,
  ];
  static SavableColorArray mote_colors = SavableColorArray(
      "mote_colors",
      "Mote Colors",
      mote_dark,
      (scheme) =>
          (scheme.brightness == Brightness.light) ? mote_dark : mote_light);

  int update_count = 0;
  int build_count = 0;
  int paint_count = 0;
  int size_change = 0;
  bool print_once = false;

  FlowField(this.item) : field = item.field {
    print(
        "RED: Created new flow ${item.route} -------------------------------");
    updateSettings();
  }

  String debugPrint() {
    String vs = field.debugPrint();
    return ("b${build_count}, p$paint_count/" +
        "a${x_axis.paint_count}/${repaint_counter.value}, " +
        "u$update_count, time ${zzz(time)} dt=" +
        "${zzz(min_dt)}/${zzz(max_dt)} m${motes.length} $vs");
  }

  void dispose() {
    print("RED: Disposing of ${item.route}");
  }

  static void initSettings(Settings settings) {
    settings.add(axis_color);
    settings.add(mote_colors);
    settings.add(EndOfRow());
    settings.add(feather_color);
    settings.add(x_isocline_color);
    settings.add(y_isocline_color);
    settings.add(EndOfRow());
    settings.add(velocity_scale);
  }

  void updateSettings() {
    // print("Update colors.");
    x_axis.color = axis_color.value;
    y_axis.color = axis_color.value;
    repaint_counter.value++;
  }

  void updateTime(double dt) {
    update_count++;
    if (dt > max_dt) max_dt = dt;
    if (dt < min_dt) min_dt = dt;
    field.update(time, dt);
    streams.update(this, time);
    // Update each position and veolicy.
    for (Mote m in motes) {
      m.update(field, time, dt);
    }
    // Update time.
    time = time + dt;
    if (time > field.period) {
      int n = (time / field.period).floor();
      time -= n * field.period;
      // print("Wrap time by $n to ${zzz(time)}");
    }
  }

  void triggerRepaint() {
    repaint_counter.value++;
  }

  void paint(Canvas canvas, Size size) {
    paint_count++;
    // print("Flow Painting.");
    if (transform.sizeChanged(size)) {
      x_axis.print_once = false;
      size_change++;
      transform.resize(size);
      x_axis.resize(transform);
      y_axis.resize(transform);
    }
    field.print_once = print_once;
    if (draw_isocline) _paintIsocline(canvas);
    if (draw_field) _paintFlow(canvas);

    var paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    print_once = false;
    // If a mote goes too far off the edge of the screen.
    double too_big = 100.0 * size.width + 100.0 * size.height;
    for (Mote m in motes) {
      Offset o1 = transform.toScreenV(m.position);
      Vector2 p2 = m.position + (m.velocity * velocity_scale.value);
      Offset o2 = transform.toScreenV(p2);
      if (o1.dx.abs() > too_big ||
          o1.dy.abs() > too_big ||
          o2.dx.abs() > too_big ||
          o2.dy.abs() > too_big) {
        print("Error in mote ${zzz(m.position)} o1=${zzz(o1)}, o2=${zzz(o2)}.");
        m.position = Vector2(0, 0);
        m.velocity = Vector2(0, 0);
        o1 = Offset(0, 0);
        o2 = Offset(0, 0);
      }
      paint.color = m.color;
      canvas.drawLine(o1, o2, paint);
    }
    paintTimeText(canvas, size);
  }

  void paintTimeText(Canvas canvas, Size size) {
    final style = TextStyle(
      color: axis_color.value,
      fontSize: 10.0,
    );
    String text = "t=${zzz(time)}";
    var span = TextSpan(text: text, style: style);
    var painter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    );
    painter.layout();
    Offset offset = Offset(5, size.height - painter.height - 5);
    painter.paint(canvas, offset);
  }

  void _paintIsocline(Canvas canvas) {
    Paint x_paint = Paint()
      ..color = x_isocline_color.value
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path x_isocline = field.x_isocline(time, transform);
    canvas.drawPath(x_isocline, x_paint);
    Paint y_paint = Paint()
      ..color = y_isocline_color.value
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path y_isocline = field.y_isocline(time, transform);
    canvas.drawPath(y_isocline, y_paint);
  }

  void _paintFlow(Canvas canvas) {
    Paint paint = Paint()
      ..color = feather_color.value
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    double dx = (transform.max.x - transform.min.x) / 20.0;
    double dy = (transform.max.y - transform.min.y) / 20.0;
    for (double x = transform.min.x; x <= transform.max.x; x += dx) {
      for (double y = transform.min.y; y <= transform.max.y; y += dy) {
        Vector2 position = Vector2(x, y);
        Vector2 velocity = field.velocity(Vector2(x, y), time);
        Vector2 p2 = position + (velocity * velocity_scale.value);
        Offset o1 = transform.toScreenV(position);
        Offset o2 = transform.toScreenV(p2);
        canvas.drawLine(o1, o2, paint);
      }
    }
  }

  Widget build(BuildContext context) {
    build_count++;
    repaint_counter.value++;
    // This happens on every state change.
    // print("YELLOW: building flow field ${item.route} with context = ${context}, "
    //   + "mounted = ${context.mounted}");
    return Listener(
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent) {
            onScrollWheel(pointerSignal);
          }
        },
        child: GestureDetector(
            onTapUp: (info) {
              onTapUp(info);
            },
            onScaleStart: (info) {
              transform.scaleStart(info.localFocalPoint);
            },
            onScaleUpdate: (info) {
              scaleUpdate(info.localFocalPoint, info.scale);
            },
            child: CustomPaint(
              foregroundPainter:
                  MotePainter(flow: this, repaint: repaint_counter),
              child: Container(),
              painter: AxisPainter(transform, axis_color.value, x_axis, y_axis),
            )));
  }

  void onScrollWheel(PointerScrollEvent event) {
    transform.scaleStart(event.localPosition);
    double scroll_screen = event.scrollDelta.dx - event.scrollDelta.dy;
    double scale = math.exp(scroll_screen / 400.0);
    scaleUpdate(event.localPosition, scale);
  }

  void scaleUpdate(Offset offset, double scale) {
    transform.scaleUpdate(offset, scale);
    x_axis.resize(transform);
    y_axis.resize(transform);
    repaint_counter.value++;
  }

  void onTapUp(TapUpDetails details) {
    Offset screen = details.localPosition;
    Vector2 world = transform.toWorldV(screen);
    // print("TapUp pos ${zzz(screen)} -> ${zzz(world)}.");
    Color color = mote_colors.value[current_mote_color];
    current_tool.onTap(this, world, color);
  }

  void clearAll() {
    // print("RED: Clear all ${motes.length}.");
    motes = [];
    streams.clear();
  }

  void addMote(Vector2 pos, Color color) {
    // print("BLUE: add mote ${zzz(pos)} $color.");
    motes.add(Mote(pos, color));
    repaint_counter.value++;
  }

  void addStream(Vector2 pos, Color color) {
    // print("BLUE: stream ${zzz(pos)} $color.");
    streams.add(pos, color);
  }

  void addGrid(Vector2 pos, Color color) {
    // print("BLUE: grid ${zzz(pos)} $color.");
    double delta = math.min(transform.max.x - transform.min.x,
            transform.max.y - transform.min.y) /
        4;
    var dx_sign = [delta, delta, -delta, -delta]; //Same length as mote_color.
    var dy_sign = [delta, -delta, -delta, delta];
    for (double dx = 0.1; dx < 1.0; dx += 0.1) {
      for (double dy = 0.1; dy < 1.0; dy += 0.1) {
        for (int i = 0; i < dx_sign.length; i++) {
          motes.add(Mote(
              Vector2(pos.x + dx_sign[i] * dx, pos.y + dy_sign[i] * dy),
              mote_colors.value[i]));
        }
      }
    }

    repaint_counter.value++;
  }
}
