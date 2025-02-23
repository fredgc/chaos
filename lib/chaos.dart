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
import 'dart:ui';

import 'field.dart';
import 'transform.dart';

class Chaos extends VectorField {
  // Period is actually 2, 100 is a multiple of 2 and looks nicer.
  @override
  double get period => 100;
  double sin = 0.0;

  @override
  void update(double t, double dt) {
    sin = math.sin(math.pi / 2.0 * t);
  }

  @override
  double fx(double x, double y, double t) {
    return 0.7 * y + 10 * x * (0.1 - y * y);
  }

  @override
  double fy(double x, double y, double t) {
    return -x + 0.25 * sin;
  }

  Path x_isocline(double t, CoordinateTransform transform) {
    Path path = Path();
    // x-isocline is where x' = 0, or
    // 0 = 0.7*y + 10*x*(0.1 - y*y)
    // 0 = 0.7y  + x - 10xy^2.
    //                    |y .
    //                    |   .
    //                    |    ...
    //  .............     |        `````````....
    //                ... |
    //                   .|
    //  ------------------+------------------- x
    //                    |.
    //                    | ...
    //  ....              |    ................
    //      ``````..      |
    //              ``    |
    //                `.  |
    // Method 1:
    // Solve for x = -.7y / (1-10y^2). Good for largish y. (x -> 0 as y -> inf)
    // (Use method 1 for  |y| >= 1/2. |x| <= 0.23333.
    // Method 2:
    // Use quadratic formula on 0 = 10x y^2 - 0.7y  - x
    // y = (-b +/- sqrt(b^2 - 4ac)) / 2a.
    // y = (.7  +/- sqrt(0.035 + 40x^2) ) / 20x.   (good for larger x)
    // Method 3:
    // inverted quadratic formula on 0 = 10x y^2 - 0.7y  - x
    // y = 2c / (-b +/- sqrt(b^2 - 4ac))
    // y = (-2x)/(.7 +/- sqrt(0.035 + 40x^2)). (Good for the + sign)
    //
    // Use Method 3, with + sign, to get center line.
    transform.drawPath(path, transform.min.x, transform.max.x, (x) => x,
        (x) => -2 * x / (0.7 + math.sqrt(0.035 + 40 * x * x)));

    // As x -> inf. y -> sqrt(0.1) = .316
    double y0 = math.sqrt(0.1);
    // Switch between method 1 and method 2 at (x1, y1).
    // Pick a nice y1:
    double y1 = 0.4;
    double x1 = -.7 * y1 / (1 - 10 * y1 * y1);
    // For |y| > 0.5, use method 1. (left side, y < -y1)
    transform.drawPath(path, transform.min.y, -y1,
        (y) => -.7 * y / (1 - 10 * y * y), (y) => y);
    // For |y| < y1, and |x| >= x1, use method 2.
    // Use - sqrt in quadratic formula for y < 0.
    transform.drawPath(path, transform.min.x, -y1, (x) => x,
        (x) => (0.7 + math.sqrt(0.035 + 40 * x * x)) / (20 * x));

    // For |y| > 0.5, use method 1. (right side, y > y1)
    transform.drawPath(
        path, y1, transform.max.y, (y) => -.7 * y / (1 - 10 * y * y), (y) => y);
    // For |y| < 0.5, and |x| >= 0.23333, use method 2.
    // Use + sqrt in quadratic formula for y > 0.
    transform.drawPath(path, x1, transform.max.x, (x) => x,
        (x) => (0.7 + math.sqrt(0.035 + 40 * x * x)) / (20 * x));
    return path;
  }

  Path y_isocline(double t, CoordinateTransform transform) {
    Path path = Path();
    // x = 0.25 sin(pi/2 * t). This is a vertical line depending on t.
    double x = 0.25 * sin;
    Offset offset = transform.toScreen(x, transform.min.y);
    path.moveTo(offset.dx, offset.dy);
    offset = transform.toScreen(x, transform.max.y);
    path.lineTo(offset.dx, offset.dy);
    return path;
  }
}
