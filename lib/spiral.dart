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

import 'field.dart';
import 'transform.dart';

class Spiral extends VectorField {
  static const scale = 0.5;

  @override
  double get period {
    return 314.159;
  }

  double epsilon = 0;

  @override
  int get parameter_count => 1;

  @override
  void setParameter(int i, double value) {
    epsilon = (value - 0.5) * scale;
  }

  @override
  double getParameter(int i) => 0.5 + epsilon / scale;

  // p' = [ e  1; -1 e] * p = epislon * p + rotation * p
  @override
  double fx(double x, double y, double t) {
    return epsilon * x + y;
  }

  @override
  double fy(double x, double y, double t) {
    return -x + epsilon * y;
  }

  @override
  Path x_isocline(double t, CoordinateTransform transform) {
    // x-isocline is curve where x' is 0.
    // y = - epsilon * x
    Path path = Path();
    double y1 = -epsilon * transform.min.x;
    double y2 = -epsilon * transform.max.x;
    Offset offset1 = transform.toScreen(transform.min.x, y1);
    Offset offset2 = transform.toScreen(transform.max.x, y2);
    path.moveTo(offset1.dx, offset1.dy);
    path.lineTo(offset2.dx, offset2.dy);
    return path;
  }

  @override
  Path y_isocline(double t, CoordinateTransform transform) {
    // y-isocline is curve where y' is 0.
    // x = epsilon * y
    Path path = Path();
    double x1 = epsilon * transform.min.y;
    double x2 = epsilon * transform.max.y;
    Offset offset1 = transform.toScreen(x1, transform.min.y);
    Offset offset2 = transform.toScreen(x2, transform.max.y);
    path.moveTo(offset1.dx, offset1.dy);
    path.lineTo(offset2.dx, offset2.dy);
    return path;
  }
}
