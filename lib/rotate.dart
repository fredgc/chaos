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

class Rotate extends VectorField {
  @override
  double get period {
    return 314.159;
  }

  double stir = 0;

  @override
  int get parameter_count => 1;

  @override
  void setParameter(int i, double value) {
    stir = value;
  }

  @override
  double getParameter(int i) => stir;

  @override
  double fx(double x, double y, double t) {
    return y + saw(x);
    // smag = .1*stir.  (stir = slider)
    // y + smag *math.abs(4*x - math.floor(4*x) - 0.5)
  }

  @override
  double fy(double x, double y, double t) {
    return -x + saw(y);
    // -x + smag *math.abs(4*y - math.floor(4*y) - 0.5)
  }

  // This saw-tooth function is piecewise linear in z,
  // It has discontinuities when z is an integer (z = n), or when
  // z - floor(z) - 0.5 = 0.  i.e. z = (0.5 + n).
  double saw(double z) {
    double smag = 2.5 * stir;
    return smag * (z - (z).floor() - 0.5).abs();
  }

  @override
  Path x_isocline(double t, CoordinateTransform transform) {
    // x-isocline is curve where x' is 0.
    // y = - saw(x)
    // Same computation as above.
    Path path = Path();
    int n1 = (2 * transform.min.x).floor();
    int n2 = (2 * transform.max.x).ceil();
    bool first = true;
    for (int n = n1; n <= n2; n++) {
      double x = n / 2.0;
      Offset offset = transform.toScreen(x, -saw(x));
      if (first) {
        path.moveTo(offset.dx, offset.dy);
      } else {
        path.lineTo(offset.dx, offset.dy);
      }
      first = false;
    }
    return path;
  }

  @override
  Path y_isocline(double t, CoordinateTransform transform) {
    Path path = Path();
    // y-isocline is curve where y' is 0.
    // x = saw(y).
    // saw is linear from n/4 to n+1/4.
    // pick n1 = minimum n, i.e. floor(4 * y_min.)
    int n1 = (2 * transform.min.y).floor();
    int n2 = (2 * transform.max.y).ceil();
    bool first = true;
    for (int n = n1; n <= n2; n++) {
      double y = n / 2.0;
      Offset offset = transform.toScreen(saw(y), y);
      if (first) {
        path.moveTo(offset.dx, offset.dy);
      } else {
        path.lineTo(offset.dx, offset.dy);
      }
      first = false;
    }
    return path;
  }
}
