import 'dart:math';

import 'package:flutter/material.dart';

class LightData {
  final bool on;
  final Color onColor;

  LightData(this.on, this.onColor);
}

const colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
];

List<LightData> genLightData() {
  return List.generate(
    3,
        (i) => LightData(i % 2 == 0, colors[Random().nextInt(colors.length)]),
  );
}
