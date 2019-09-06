import 'package:flutter/material.dart';

/// A widget representing a light bulb that switches between displaying
/// the text "on" and "off" when tapped
class ImprovedLight extends StatefulWidget {
  /// Whether the light is initially on
  final bool initiallyOn;

  final Color onColor;

  ImprovedLight({this.initiallyOn = false, this.onColor = Colors.yellow});

  @override
  State<StatefulWidget> createState() => ImprovedLightState();
}

class ImprovedLightState extends State<ImprovedLight> {
  bool currentlyOn;

  @override
  Widget build(BuildContext context) {
    currentlyOn ??= widget.initiallyOn;

    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: currentlyOn ? widget.onColor : Colors.black,
            shape: BoxShape.circle,
          ),
          child: SizedBox.fromSize(
            size: Size.square(50),
          ),
        ),
        onTap: () {
          setState(() {
            currentlyOn = !currentlyOn;
          });
        },
      ),
    );
  }
}
