import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:follow_up/Api/app_service.dart';
import 'package:follow_up/Controller/login_controller.dart';

import 'package:follow_up/Function/decoration.dart';
import 'package:follow_up/LoginScreen/get_otp.dart';
import 'package:follow_up/LoginScreen/loader.dart';
import 'package:follow_up/Model/login_details.dart';
import 'package:follow_up/Model/moderator_details.dart';
import 'package:follow_up/Moderator/moderator.dart';
import 'package:follow_up/TenantAdmin/Tenant_Home.dart';
import 'package:follow_up/User/UserHome.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginContainers extends StatefulWidget {
  const LoginContainers({Key? key}) : super(key: key);

  @override
  State<LoginContainers> createState() => _LoginContainersState();
}

class _LoginContainersState extends State<LoginContainers> {
  var username;
  var password;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  // ModeratorStudentController moderatorStudentController =
  //     Get.put(ModeratorStudentController());
  LoginController loginController = Get.put(LoginController());

  get appService => null;
  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        print('User email: ${account.email}');
        print('User display name: ${account.displayName}');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  bool _passwordVisible = false; // renamed _passwordVisible for clarity
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextFormField(
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: usernamecontroller,
                decoration: buildInputDecoration(
                    icon: Icons.person_2_outlined, hintText: 'User Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter User Name';
                  } else if (value.length < 6) {
                    return 'User Name must be at least 6 characters long';
                  } else {
                    username = value;
                  }
                  return null;
                },
              ),
            ),
            // DateSelection(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextFormField(
                controller: passwordcontroller,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 120, 119, 119),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  } else {
                    password = value;
                  }
                  return null;
                },
              ),
            ),

            SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: () async {
                showLoader(context);

                if (_formKey.currentState!.validate()) {
                  var username = usernamecontroller.text;
                  var password = passwordcontroller.text;

                  // Call your AppService to get authorization
                  var authService = AppService();
                  var response =
                      await authService.getAuthorization(username, password);

                  print("main response");
                  print(response);

                  if (response != null) {
                    // Check if the response contains an error message
                    if (response.containsKey('error')) {
                      // Authentication failed due to incorrect credentials
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Authentication failed: ${response['message']}'),
                        ),
                      );
                    } else {
                      // Authentication successful, navigate based on user type
                      String userType = response['user_type'];

                      final loginsBox = LoginDetailsDB().box;

                      await loginsBox.clear();

                      await loginsBox.put(
                        'loginDetails',
                        LoginDetails(
                          token: response['token'],
                          userName: response['user_name'],
                        ),
                      );
                      switch (userType) {
                        case 'moderator':
                          Get.to(ModeratorHome());
                          print("reached here");

                          loginController.isLoggedIn.value = true;

                          break;
                        case 'student':
                          Get.to(() => UserHome());
                          loginController.isLoggedIn.value = true;

                          break;
                        case 'tenant_admin':
                          Get.to(TenantHome());
                          loginController.isLoggedIn.value = true;

                        default:
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Unknown user type. Please contact support.'),
                            ),
                          );
                      }
                    }
                  } else {
                    // Authentication failed or error occurred
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error! Please try again.'),
                      ),
                    );
                  }
                }
              },
              text: 'Login',
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.to(Getotp());
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: _handleSignIn,
              child:
                  Text('or Login With', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image(
                height: 45,
                width: 45,
                image: AssetImage('assets/google.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
