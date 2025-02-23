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

import 'package:vector_math/vector_math.dart' show Vector2;

import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'flow.dart';
import 'field.dart';
import 'transform.dart';

class Mote {
  Vector2 position;
  Vector2 velocity = Vector2(0.05, 0);
  Color color;

  Mote(this.position, this.color);

  void update(VectorField field, double t, double dt) {
    // Use Runge-Kutta.
    Vector2 k1 = field.velocity(position, t);
    Vector2 k2 = field.velocity(position + k1 * (dt / 2), t + dt / 2);
    Vector2 k3 = field.velocity(position + k2 * (dt / 2), t + dt / 2);
    Vector2 k4 = field.velocity(position + k3 * dt, t + dt);
    velocity = k4;
    position = position + (k1 + k2 * 2 + k3 * 2 + k4) * (dt / 6);
  }
}

class MoteStream {
  Vector2 position;
  Color color;
  int count = 50;

  MoteStream(this.position, this.color);
}

class MoteStreamList {
  List<MoteStream> list = [];
  double last_time = 0.0;
  final double max_dt = 0.1; // How often to add a new mote.

  void add(Vector2 position, Color color) {
    // print("Added new stream at ${zzz(position)}");
    list.add(MoteStream(position, color));
  }

  void update(FlowField flow, double t) {
    if (list.length == 0) return;
    if (last_time + max_dt > t) {
      return;
    }
    last_time = t;
    int stale_count = 0;
    for (MoteStream stream in list) {
      flow.addMote(stream.position.clone(), stream.color);
      if (stream.count-- < 0) stale_count++;
    }
    // print("stale_count = ${stale_count}, list..ength = ${list.length}");
    list = list.sublist(stale_count);
  }

  void clear() {
    list.clear();
  }
}
