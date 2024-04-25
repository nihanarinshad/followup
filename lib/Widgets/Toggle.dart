import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Toggle extends StatefulWidget {
  const Toggle({super.key});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  List<bool> activeStatusList = List.generate(5, (index) => true);
  late int indexValuess = 0;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
        minWidth: 80.0,
        cornerRadius: 20.0,
        activeBgColors: [
          [Colors.red[800]!],
          [Colors.red[800]!]
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.grey,
        inactiveFgColor: Colors.white,
        initialLabelIndex: indexValuess,
        totalSwitches: 2,
        labels: ['Yes', 'No'],
        radiusStyle: true,
        onToggle: (index) {
          print('switched to: $index');
          indexValuess = index!;

          setState(() {});
          // print(indexValuess);
        });
  }
}
