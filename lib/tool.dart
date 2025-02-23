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
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math.dart' show Vector2;

import 'mote.dart';
import 'flow.dart';

enum ToolItem {
  add("Add", "Click to add one mote to the flow", Icons.add_circle),
  stream("Stream", "Click to add a stream of motes to the flow", Icons.gesture),
  grid("Grid", "Click to add a grid of motes to the flow", Icons.grid_4x4);

  const ToolItem(this.name, this.tooltip, this.icon);

  final String name;
  final String tooltip;
  final IconData icon;

  void onTap(FlowField flow, Vector2 pos, Color color) {
    switch (this) {
      case add:
        return flow.addMote(pos, color);
      case stream:
        return flow.addStream(pos, color);
      case grid:
        return flow.addGrid(pos, color);
    }
  }
}
