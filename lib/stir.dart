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
import 'printer.dart';

class Stir extends VectorField {
  double stir = 0;
  double xcent = 0.5;
  double ycent = 0.5;

  @override
  int get parameter_count => 1;

  @override
  void setParameter(int i, double value) {
    stir = value;
  }

  @override
  double getParameter(int i) => stir;

  @override
  void update(double t, double dt) {
    // XXX -- use, istir += stir*dt*0.1;
    // xcent = cos(istir), ycent = sin(istir).

    // Slowly rotate the center at the speed of stir^2.
    double ct = math.cos(stir * 0.2 * dt);
    double st = math.sin(stir * 0.2 * dt);
    double temp = xcent * ct - ycent * st;
    ycent = xcent * st + ycent * ct;
    xcent = temp;
  }

  @override
  String debugPrint() {
    return "stir=${zzz(stir)}, cent=(${zzz(xcent)}, ${zzz(ycent)})";
  }

  // Piecewise linear, with corners at +/-cent/2.
  // Like this:
  //            /
  //       /\  /
  //      /  \/
  //     /
  double f(double x, double cent) {
    double d = x.abs();
    double a = cent.abs();
    if (d < a * .5) {
      return -x;
    } else if (x < 0) {
      return x + a;
    } else {
      return x - a;
    }
  }

  @override
  double fx(double x, double y, double t) {
    return -0.2 * x * x * x + 3 * f(y, ycent);
  }

  @override
  double fy(double x, double y, double t) {
    return -0.2 * y * y * y - 3 * f(x, xcent);
  }

  Path x_isocline(double t, CoordinateTransform transform) {
    Path path = Path();
    // To avoid singularities of the cube root, we'll solve
    //  -0.2*x*x*x + 3*f(y, ycent) = 0 for y, and pick the right branches.
    double a = ycent.abs();
    //  f(y,a) = 1/15*x^3
    //  {-y, y+a, y-a} = 1/15 x^3.
    //  The branches intersect at y= +-a/2, or x = +/- (16a/2)^(1/3)
    double x0 = math.pow(15 * a / 2.0, 1.0 / 3.0).toDouble();
    // First branch: y+a = x^/15, from min to x0.
    transform.drawPath(
        path, transform.min.x, x0, (x) => x, (x) => (-a + x * x * x / 15.0));
    // Second branch: -y = x^/15, from -x0 to x0.
    transform.drawPath(path, -x0, x0, (x) => x, (x) => (-x * x * x / 15.0));
    // Third branch: y-a = x^/15, from -x0 to max.
    transform.drawPath(
        path, -x0, transform.max.x, (x) => x, (x) => (a + x * x * x / 15.0));
    return path;
  }

  Path y_isocline(double t, CoordinateTransform transform) {
    Path path = Path();
    // Use the same argument as above, but with f(x,a) = -1/15 y^3.
    double a = xcent.abs();
    //  {-x, x+a, x-a} = 1/15 y^3.
    //  The branches intersect at x= +-a/2, or y = +/- (16a/2)^(1/3)
    double y0 = math.pow(15 * a / 2.0, 1.0 / 3.0).toDouble();
    // First branch: x+a = y^/15, from min to y0.
    transform.drawPath(
        path, transform.min.y, y0, (y) => (-a + y * y * y / 15.0), (y) => y);
    // Second branch: -x = y^/15, from -y0 to y0.
    transform.drawPath(path, -y0, y0, (y) => (-y * y * y / 15.0), (y) => y);
    // Third branch: x-a = y^/15, from -y0 to may.
    transform.drawPath(
        path, -y0, transform.max.y, (y) => (a + y * y * y / 15.0), (y) => y);
    return path;
  }
}
