// Copyright 2026 Google LLC
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

@Tags(['stress'])
library;

import 'dart:math' as math;
import 'dart:ui';

import 'package:chaos/field.dart';
import 'package:chaos/flow.dart';
import 'package:chaos/mote.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vector_math/vector_math.dart' show Vector2;

void main() {
  test('High-density RK4 particle simulation stays finite across all fields',
      () {
    final rng = math.Random(42);
    const moteCount = 1000;
    const steps = 500;
    const dt = 1.0 / 60.0;

    for (final fieldEnum in FieldEnum.values) {
      final flow = FlowField(fieldEnum);
      for (int i = 0; i < moteCount; i++) {
        final x = (rng.nextDouble() * 2.0 - 1.0) * 1.5;
        final y = (rng.nextDouble() * 2.0 - 1.0) * 1.5;
        flow.motes.add(Mote(Vector2(x, y), const Color(0xFF0000FF)));
      }

      for (int step = 0; step < steps; step++) {
        flow.updateTime(dt);
      }

      expect(flow.time, greaterThanOrEqualTo(0.0));
      expect(flow.time, lessThanOrEqualTo(flow.field.period));
      for (final m in flow.motes) {
        expect(
          m.position.x.isFinite && m.position.y.isFinite,
          isTrue,
          reason: 'Non-finite position in ${fieldEnum.name}: ${m.position}',
        );
        expect(
          m.velocity.x.isFinite && m.velocity.y.isFinite,
          isTrue,
          reason: 'Non-finite velocity in ${fieldEnum.name}: ${m.velocity}',
        );
      }
      flow.dispose();
    }
  });

  test('MoteStreamList emits and advances motes over long simulation loop', () {
    final flow = FlowField(FieldEnum.chaos);
    for (int i = 0; i < 10; i++) {
      flow.streams.add(
        Vector2(-1.0 + i * 0.2, -0.5 + i * 0.1),
        const Color(0xFF00FF00),
      );
    }

    const dt = 0.05;
    for (int step = 0; step < 300; step++) {
      flow.updateTime(dt);
    }

    expect(flow.motes.length, greaterThan(100));
    expect(flow.streams.list, isEmpty);
    for (final m in flow.motes) {
      expect(m.position.x.isFinite && m.position.y.isFinite, isTrue);
    }
    flow.dispose();
  });
}
