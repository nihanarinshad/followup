import 'package:follow_up/Model/login_details.dart';
import 'package:get/get.dart';

class LoginController extends GetxService {
  RxBool isLoggedIn = false.obs;
  Map<String, String> getHeaders() {
    var loginBox = LoginDetailsDB().box;

    final loginDetails = loginBox.get('loginDetails');

    Map<String, String> loginHeader = {
      'Authorization': 'Bearer ${loginDetails!.token}',
      'content-Type': 'application/json',
    };
    return loginHeader;
  }
 
}
