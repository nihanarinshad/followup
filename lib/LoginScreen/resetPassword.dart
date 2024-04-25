import 'package:flutter/material.dart';
import 'package:follow_up/Function/decoration.dart';
import 'package:follow_up/LoginScreen/LoginRegister.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:follow_up/Widgets/Textfield_letters.dart';
import 'package:get/get.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});
  @override
  State<Resetpassword> createState() => _loginpageState();
}

class _loginpageState extends State<Resetpassword> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false; // Track whether password is visible or not
  bool _passwordVisibles = false;
  String _password = '';
  String _confirmPassword = '';

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
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: TextFormField(
                          controller: usernamecontroller,
                          decoration: buildInputDecoration(
                              icon: Icons.person_2_outlined, hintText: ' Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Name';
                            } else if (value.length < 6) {
                              return 'Name must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: TextFormField(
                            controller: passwordcontroller,
                            obscureText: !_passwordVisible, // Toggle visibility

                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Color.fromARGB(255, 120, 119, 119),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible =
                                        !_passwordVisible; // Toggle visibility
                                  });
                                },
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 5.0),
                              hintText: ' Password',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required. Please enter.';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters long.';
                              }
                              // You can add more validations here, such as complexity requirements.

                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: TextFormField(
                            controller: confirmpasswordcontroller,
                            obscureText:
                                !_passwordVisibles, // Toggle visibility

                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Color.fromARGB(255, 120, 119, 119),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisibles =
                                        !_passwordVisibles; // Toggle visibility
                                  });
                                },
                                icon: Icon(
                                  _passwordVisibles
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 5.0),
                              hintText: 'Confirm Password',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _confirmPassword = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm password is required. Please enter.';
                              }
                              if (value != _password) {
                                return 'Confirm password does not match.';
                              }
                              return null;
                            }),
                      ),
                      CustomElevatedButton(
                          text: 'Get otp',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
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
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              )))
        ]),
      ),
    );
  }
}
