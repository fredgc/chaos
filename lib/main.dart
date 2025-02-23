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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'field.dart';
import 'flow.dart';
import 'help.dart';
import 'widget.dart';
import 'settings.dart';

void main() async {
  print("RED: Start of main.");
  MyAppBuilder builder = MyAppBuilder();
  FlowAppWidgetState.initSettings(Settings.instance);
  runApp(builder.makeApp());
}

class MyAppBuilder {
  Map<String, WidgetBuilder> routes = {};

  MyAppBuilder() {
    routes[SettingsScreen.routeName] =
        (BuildContext context) => SettingsScreen();
    routes[HelpScreen.routeName] = (BuildContext context) => HelpScreen();
    for (var f in FieldEnum.values) {
      routes[f.route] = makeBuilder(f);
    }
  }

  WidgetBuilder makeBuilder(FieldEnum f) {
    return (BuildContext context) => FlowAppWidget(FlowField(f), f);
  }

  MaterialApp makeApp() {
    return MaterialApp(
      title: "Dynamic System Demo",
      routes: routes,
      initialRoute: FieldEnum.rotate.route,
      debugShowCheckedModeBanner: false,
    );
  }
}
