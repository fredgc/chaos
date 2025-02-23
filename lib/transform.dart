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
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:vector_math/vector_math.dart' show Vector2;

import 'printer.dart';

class CoordinateTransform {
  Size size = Size(0, 0); // Screen size.
  Vector2 offset = Vector2(0, 0); // Screen coords mapped to by (0,0).
  double zoom = 1.0; // zoom from world to screen.
  Vector2 min = Vector2(-2, -2);
  Vector2 max = Vector2(2, 2);

  bool use_debug_rect = false;

  bool sizeChanged(Size size) {
    return size != this.size;
  }

  void pan(Offset delta) {
    offset = Vector2(offset.x + delta.dx, offset.y + delta.dy);
    findMax();
  }

  double startZoom = 1;
  Offset zoomFocus = Offset(0, 0);

  void scaleStart(Offset focus) {
    startZoom = zoom;
    zoomFocus = focus;
  }

  void scaleUpdate(Offset focus, double scale) {
    Vector2 focus_world = toWorldV(zoomFocus);
    // We want to change the zoom, and then we want the old zoom focus
    // to map to the new zoom focus.
    zoom = startZoom * scale;
    Offset center = toScreenV(focus_world);
    offset = Vector2(
        offset.x - center.dx + focus.dx, offset.y - center.dy + focus.dy);
    zoomFocus = focus;
    findMax();
  }

  void resize(Size size) {
    // print("BLUE: Size ${this.size} -> $size");
    if (this.size.width > 0) {
      offset = Vector2(
        offset.x + (size.width - this.size.width) / 2,
        offset.y + (size.height - this.size.height) / 2,
      );
    } else {
      offset = Vector2(size.width / 2, size.height / 2);
      zoom = math.min(size.width, size.height) / 3.0;
    }
    this.size = size;
    findMax();
    // print("${zzz(size)}, offset=${zzz(offset)}, min = ${zzz(min)}, max = ${zzz(max)}, zoom = ${zzz(zoom)}");
  }

  void findMax() {
    if (use_debug_rect) {
      min = toWorld(size.width * 0.25, size.height * 0.75);
      max = toWorld(size.width * 0.75, size.height * 0.25);
    } else {
      min = toWorld(0, size.height);
      max = toWorld(size.width, 0);
    }
  }

  Vector2 toWorldV(Offset pos) {
    return toWorld(pos.dx, pos.dy);
  }

  Vector2 toWorld(double x, double y) {
    return Vector2((x - offset.x) / zoom, (offset.y - y) / zoom);
  }

  Offset toScreenV(Vector2 pos) {
    return toScreen(pos.x, pos.y);
  }

  Offset toScreen(double x, double y) {
    return Offset(offset.x + zoom * x, offset.y - zoom * y);
  }

  // Draw the parameterized path from t0 to t1.
  void drawPath(Path path, double t0, double t1, Function(double t) x,
      Function(double t) y) {
    bool first = true;
    final int count = 50;
    double dt = (t1 - t0) / count.toDouble();
    for (int n = 0; n <= count; n++) {
      double t = t0 + n * dt;
      Offset offset = toScreen(x(t), y(t));
      if (first) {
        path.moveTo(offset.dx, offset.dy);
      } else {
        path.lineTo(offset.dx, offset.dy);
      }
      first = false;
    }
  }
}
