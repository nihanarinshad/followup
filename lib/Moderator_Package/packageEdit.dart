import 'package:flutter/material.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/Dropdown.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:follow_up/Widgets/TextfieldwithouticononlyNumbers.dart';
import 'package:follow_up/Widgets/Textfield_numbers.dart';
import 'package:follow_up/Widgets/Textfieldwithouticononlyletters.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ModeratorPackagesedit extends StatefulWidget {
  const ModeratorPackagesedit({super.key});

  @override
  State<ModeratorPackagesedit> createState() => _PackagesaddState();
}

class _PackagesaddState extends State<ModeratorPackagesedit> {
  TextEditingController Name = TextEditingController();
  TextEditingController Amount = TextEditingController();
  TextEditingController Description = TextEditingController();
  late int indexValuess = 0;

  String? _duration;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Package',
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          TextfieldwithouticononlyLetters(
            Controllers: Name,
            Textadd: 'Package Name',
          ),
          // ContainersDropdown(
          //   hinttext: 'Duration 1 Months/2 months', items: [],
          //   value: _duration, // Selected dropdown value
          //   onChanged: (String? value) {
          //     setState(() {
          //       _duration = value;
          //     });
          //   },
          // ),
          TextfieldwithouticononlyLetters(
            Controllers: Description,
            Textadd: 'Description',
          ),
          ContainersNumbers(
            Controllers: Name,
            Textadd: 'File Upload',
            icon: Icons.file_copy,
          ),
          TextfieldwithouticononlyNumbers(
            Controllers: Amount,
            Textadd: 'Amount',
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enabled',
                  style: TextStyle(color: Colors.grey),
                ),
                ToggleSwitch(
                  minWidth: 60.0,
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
                  },
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            onPressed: () {},
            text: 'Continue',
          )
        ],
      ),
    );
  }
}
