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
import 'package:flutter/material.dart';

import 'transform.dart';
import 'printer.dart';

class AxisPainter extends CustomPainter {
  CoordinateTransform transform;
  Color color;
  PlotAxis x_axis;
  PlotAxis y_axis;

  int paint_count = 0;

  AxisPainter(this.transform, this.color, this.x_axis, this.y_axis);

  @override
  void paint(Canvas canvas, Size size) {
    paint_count++;
    // print("Axis Painting.");
    if (transform.sizeChanged(size)) {
      // x_axis.print_once = true;
      transform.resize(size);
      x_axis.resize(transform);
      y_axis.resize(transform);
    }
    var paint = Paint()
      ..color = color
      // ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    x_axis.paint(canvas, transform, paint);
    y_axis.paint(canvas, transform, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // XXX -- this seems to always be true.
    bool should = (this != oldDelegate);
    // print("FDGC: calling shouldRepaint. should = $should.");
    return should;
  }
}

class Label {
  TextPainter painter;
  Offset offset;
  Label(this.painter, this.offset);
}

class PlotAxis {
  PlotAxis({required this.vertical});

  bool vertical; // If this is the y-axis.
  double min = 0;
  double max = 0; // Min and max for axis.
  double dt2 = 0; // tick mark spacing.
  double dt = 0; // label spacing.
  double tick_length = 0;
  List<Label> labels = [];
  Color color = Colors.white;

  int paint_count = 0;
  bool print_once = false;

  @override
  void paint(Canvas canvas, CoordinateTransform transform, Paint paint) {
    paint_count++;
    if (print_once) {
      print(
          "ORANGE: Axis painting vertical=$vertical, min = ${zzz(min)}, max = ${zzz(max)}");
    }
    drawLine(canvas, transform, paint, 0, min, 0, max);
    for (double tic = min; tic < max; tic += dt2) {
      // Small ticks.
      drawLine(canvas, transform, paint, -tick_length, tic, tick_length, tic);
    }
    for (Label label in labels) {
      label.painter.paint(canvas, label.offset);
    }
    print_once = false;
  }

  void drawLine(Canvas canvas, CoordinateTransform transform, Paint paint,
      double x1, double y1, double x2, double y2) {
    if (vertical) {
      canvas.drawLine(
          transform.toScreen(x1, y1), transform.toScreen(x2, y2), paint);
    } else {
      canvas.drawLine(
          transform.toScreen(y1, x1), transform.toScreen(y2, x2), paint);
    }
  }

  void resize(CoordinateTransform transform) {
    if (vertical) {
      this.min = transform.min.y;
      this.max = transform.max.y;
    } else {
      this.min = transform.min.x;
      this.max = transform.max.x;
    }
    if (print_once) {
      print(
          "ORANGE: Axis resize: vertical=$vertical, New min = ${zzz(min)}, max = ${zzz(max)}");
    }
    setupBounds(transform);
    createLabels(transform, color);
  }

  void setupBounds(CoordinateTransform transform) {
    double scale = (math.log(max - min) / math.log(10));
    dt = math.pow(10.0, scale.floor()).toDouble();
    dt2 = dt / 5;
    if ((((max - min) / dt)) < 3.0) {
      dt = dt / 5;
      dt2 = dt / 2;
    } else if ((max - min) / dt < 5.0) {
      dt = dt / 2;
      dt2 = dt / 5;
    }
    min = (min / dt).floor() * dt; // Round down.
    max = (max / dt).ceil() * dt; // Round up.
    tick_length = 5 / transform.zoom;
    // print("Axis: min=${zzz(min)}, max=${zzz(max)}, dt=${zzz(dt)}, dt2=${zzz(dt2)}, "
    //   "tick=${zzz(tick_length)}");
  }

  void createLabels(CoordinateTransform transform, Color color) {
    labels = [];
    final style = TextStyle(
      color: color,
      fontSize: 10.0,
    );
    int label_count = ((max - min) / dt).ceil();
    for (int i = 0; i < label_count; i++) {
      String text = "${(min + i * dt).toStringAsPrecision(2)}";
      double x = 0;
      double y = 0;
      if (vertical) {
        x = 1.5 * tick_length;
        y = (min + i * dt);
      } else {
        x = (min + i * dt);
        y = 1.5 * tick_length;
      }
      var span = TextSpan(text: text, style: style);
      var painter = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
      );
      painter.layout();
      Offset lower_left = transform.toScreen(x, y);
      Offset upper_left = Offset(lower_left.dx, lower_left.dy - painter.height);
      labels.add(Label(painter, upper_left));
      // print("Label $text at (${zzz(x)}, ${zzz(y)}), ll=${zzz(lower_left)}, "
      //   "ul = ${zzz(upper_left)}");
    }
  }
}
