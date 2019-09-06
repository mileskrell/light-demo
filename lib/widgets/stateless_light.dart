import 'package:flutter/material.dart';

/// A widget representing a light bulb
class SimpleLight extends StatelessWidget {
  final bool on;
  final Color onColor;

  SimpleLight({this.on = false, this.onColor = Colors.yellow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: on ? onColor : Colors.black,
          shape: BoxShape.circle,
        ),
        child: SizedBox.fromSize(
          size: Size.square(50),
        ),
      ),
    );
  }
}
