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

import 'dart:ui';
import 'package:vector_math/vector_math.dart' show Vector2;

import 'rotate.dart';
import 'spiral.dart';
import 'stir.dart';
import 'chaos.dart';
import 'transform.dart';

abstract class VectorField {
  bool print_once = false; //Debug value.

  double fx(double x, double y, double t);
  double fy(double x, double y, double t);
  double get period => 30;
  Vector2 velocity(Vector2 pt, double t) {
    return Vector2(fx(pt.x, pt.y, t), fy(pt.x, pt.y, t));
  }

  int get parameter_count => 0;
  void setParameter(int i, double value) {}
  double getParameter(int i) => 0;
  void update(double t, double dt) {}
  Path x_isocline(double t, CoordinateTransform transform) => Path();
  Path y_isocline(double t, CoordinateTransform transform) => Path();
  String debugPrint() {
    return "";
  }
}

enum FieldEnum {
  rotate("/rotate", "Simple Rotation"),
  spiral("/spiral", "Stable/Unstable Point"),
  stir("/stir", "Stir"),
  chaos("/chaos", "Chaotic System w/Strange Attractor");

  const FieldEnum(this.route, this.title);

  final String route;
  final String title;

  VectorField get field {
    switch (this) {
      case FieldEnum.rotate:
        return Rotate();
      case FieldEnum.spiral:
        return Spiral();
      case FieldEnum.stir:
        return Stir();
      case FieldEnum.chaos:
        return Chaos();
    }
  }
}
