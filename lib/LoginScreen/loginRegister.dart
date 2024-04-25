import 'package:flutter/material.dart';
import 'package:follow_up/LoginScreen/login.dart';
import 'package:follow_up/LoginScreen/Register.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});
  @override
  State<LoginRegister> createState() => _loginpageState();
}

late int indexValuess = 0;

class _loginpageState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 229, 229),
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  color: Colors.red,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image(
                        image: AssetImage(
                          'assets/followup.png',
                        ),
                        height: 100,
                        width: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Follow Up App',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 160,
              left: 10,
              right: 20,
              // bottom: 30,
              child: Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.white,
                      offset: new Offset(6.0, 6.0),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ToggleSwitch(
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
                        labels: ['Login', 'Register'],
                        radiusStyle: true,
                        onToggle: (index) {
                          print('switched to: $index');
                          indexValuess = index!;

                          setState(() {});
                          // print(indexValuess);
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      indexValuess == 0
                          ? LoginContainers()
                          : RegisterContainers()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
