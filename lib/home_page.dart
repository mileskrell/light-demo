import 'package:flutter/material.dart';
import 'package:light_demo/resources.dart';
import 'package:light_demo/widgets/stateful_light.dart';
import 'package:light_demo/widgets/stateless_light.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool showSimple = true;
  bool showImproved = false;
  final simpleLightData = genLightData();
  final improvedLightData = genLightData();

  @override
  Widget build(BuildContext context) {
    final statelessChildren = simpleLightData.map((lightData) {
      return Padding(
        padding: EdgeInsets.all(8),
        child: SimpleLight(
          on: lightData.on,
          onColor: lightData.onColor,
        ),
      );
    }).toList();

    final statefulChildren = improvedLightData.map((lightData) {
      return Padding(
        padding: EdgeInsets.all(8),
        child: ImprovedLight(
          initiallyOn: lightData.on,
          onColor: lightData.onColor,
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          showSimple && showImproved
              ? "Light demo"
              : showImproved ? "Stateful light demo" : "Stateless light demo",
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: showSimple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: statelessChildren,
              ),
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: showImproved,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: statefulChildren,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Toggle light visibility",
        child: Icon(Icons.swap_horiz),
        onPressed: () {
          setState(() {
            if (showSimple && !showImproved) {
              // only show improved
              showSimple = false;
              showImproved = true;
            } else if (showImproved && !showSimple) {
              // show both
              showSimple = true;
            } else {
              // only show simple (the initial visibility)
              showImproved = false;
            }
          });
        },
      ),
    );
  }
}
