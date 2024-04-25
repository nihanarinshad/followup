import 'package:flutter/material.dart';
import 'package:follow_up/Function/decoration.dart';
import 'package:follow_up/LoginScreen/LoginRegister.dart';
import 'package:follow_up/LoginScreen/ResetPassword.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:follow_up/Widgets/Textfield_letters.dart';
import 'package:get/get.dart';

class Getotp extends StatefulWidget {
  const Getotp({super.key});

  @override
  State<Getotp> createState() => _loginpageState();
}

class _loginpageState extends State<Getotp> {
  TextEditingController usernamecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 229, 229),
        body: Stack(children: <Widget>[
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
              bottom: 10,
              child: SingleChildScrollView(
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
                child: Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: TextFormField(
                            controller: usernamecontroller,
                            decoration: buildInputDecoration(
                                icon: Icons.person_2_outlined,
                                hintText: 'UserName'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter User Name';
                              } else if (value.length < 6) {
                                return 'User Name must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                        CustomElevatedButton(
                            text: 'Get otp',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Proceed with login logic
                              }
                              Get.to(Resetpassword());
                            }),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          onPressed: () {
                            Get.to(LoginRegister());
                          },
                          child: const Text('Back to Login'),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              )))
        ]),
      ),
    );
  }
}
