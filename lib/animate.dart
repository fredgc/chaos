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

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart'; //For a junk ticker.

import 'flow.dart';
import 'printer.dart';
import 'transform.dart';

class MyAnimator {
  static final int clock_time = 10; // restart animation loop after 10 seconds.
  AnimationController controller;
  FlowField flow;
  double speed = 1.0;
  double previous_clock = 0.0;
  double fps_throttle;

  MyAnimator(SingleTickerProviderStateMixin tick_provider, this.flow,
      this.fps_throttle)
      : controller = AnimationController(
          vsync: tick_provider,
          duration: Duration(seconds: clock_time),
          upperBound: clock_time.toDouble(),
        ) {
    controller.view.addListener(hearTick);
    controller.addStatusListener((status) {
      // print("Animation status: $status, value = ${zzz(controller.value)}");
      if (status == AnimationStatus.completed) {
        // Warn the flow that the animation is going to reset.
        onComplete();
      }
    });
  }

  String debugPrint() {
    return (" s${zzz(speed)}");
  }

  void hearTick() {
    double dt = controller.value - previous_clock;
    if ((fps_throttle > 0) &&
        (dt < 1.0 / fps_throttle) &&
        (-dt < 1.0 / fps_throttle)) {
      return;
    }
    // Update the flow.
    const double base_speed = 0.2;
    flow.updateTime(dt * speed * base_speed);
    flow.triggerRepaint();
    previous_clock = controller.value;
  }

  void onComplete() {
    // XXX assume we want to restart.
    // But we should check if this is the start or end of a loop.
    // print("Animation restart from time ${zzz(previous_clock)}");
    previous_clock = 0;
    controller.reset();
    controller.forward();
  }

  void dispose() => controller.dispose();
  void pause() => controller.stop();
  void play() {
    controller.forward(from: controller.value);
  }

  void startLoop() {
    // TODO.
  }
  bool get isAnimating => controller.isAnimating;
}
