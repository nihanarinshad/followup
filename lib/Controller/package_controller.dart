import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/packages.dart';
import 'package:get/get.dart';

class PackageController extends GetxController {
  LoginController loginController = Get.find();

  HttpBaseClient baseClient = HttpBaseClient();
  RxList<PackagesDetails> packageDataDetailsList = <PackagesDetails>[].obs;
  RxList packageListpackageDataDetailsList = [].obs;
  RxString selectedPaymentOption = ''.obs;

  RxInt packageid = 0.obs;

  TextEditingController PackageNamecontroller = TextEditingController();
  TextEditingController Amountcontroller = TextEditingController();
  TextEditingController Descriptioncontroller = TextEditingController();
  TextEditingController paymenttypecontroller = TextEditingController();
  TextEditingController Durationcontroller = TextEditingController();
  TextEditingController periodcontroller = TextEditingController();

  Future<void> addPackages({
    required String packagename,
    required int period,
    required String discription,
    required int amount,
    required String paymenttype,
    required String subscrtype,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {
      "package_name": packagename,
      "subscr_period": period,
      "description": discription,
      "amount": amount,
      'payment_type': paymenttype,
      'subscr_type': subscrtype
      // "documents": documents
    };

    var requestBody = jsonEncode(body);
    var response =
        await baseClient.postRequest('add-package', headers, requestBody);
    print(response);
    print('response');

    print(requestBody);
    print('requestBody');

    updatePackageList();
  }

  void updatePackageList() {
    // refresh();
  }

  @override
  void onInit() {
    updatePackageList();
    super.onInit();
  }

  Future<void> editPackeg({
    required String packagename,
    required double period,
    required String discription,
    required double amount,
    required String paymenttype,
    required String subscrtype,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {
      "package_name": packagename,
      "subscr_period": period,
      "description": discription,
      "amount": amount,
      "payment_type": paymenttype,
      "subscr_type": subscrtype
    };
    var requestBody = jsonEncode(body);
    var response = await baseClient.putRequest(
        'edit-package/${packageid.value}', headers, requestBody);
    print('gdhgfhfhfnnnnnnnnnj');

    print(response);
    print('gdhgfhfhfj');

    print(requestBody);
  }

  Future<void> viewUsersss() async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    print('objectresponnnnnjgggggggggggggggggnnse');

    var body = {'id': packageid.value};
    var requestBody = jsonEncode(body);
    var response = await baseClient.postRequest(
        'view-package/${packageid.value}', headers, requestBody);
    print(response);
    print('requestBody');
    print(response);
    print(requestBody);
    print('ggggggggggggggggggggggggggggggggggggggggnnse');
    PackageNamecontroller.text = response['package']['package_name'] ?? "temp";
    Durationcontroller.text = response['package']['subscr_type'] ?? "temp";
    periodcontroller.text = response['package']['subscr_period'].toString();
    Descriptioncontroller.text = response['package']['description'];
    Amountcontroller.text = response['package']['amount'].toString();
    paymenttypecontroller.text = response['package']['payment_type'];
  }

  Future<List> PackageListView() async {
    var loginHeader = loginController.getHeaders();
    var response = await baseClient.getRequest(
      'list-packages',
      loginHeader,
    );
    print('objedddddddct');
    List responseAsList = response;
    packageListpackageDataDetailsList.value = response;
    packageListpackageDataDetailsList.value =
        packageListpackageDataDetailsList.reversed.toList();
    print(response);
    print('response');

    List<PackagesDetails> packageDetailsList = responseAsList
        .map((userData) => PackagesDetails(
              p_id: userData['id'],
              packageName: userData['package_name'],
            ))
        .toList();
    return packageListpackageDataDetailsList.value;
  }
}

//   Future<List<PackagesDetails>> packageListView() async {
//     var loginHeader = loginController.getHeaders();

//     var responsepackage = await baseClient.getRequest(
//       'list-packages',
//       loginHeader,

//       // encodedModeratorBody,
//     );
//     List responseAsList = responsepackage;
//     packageDataDetailsList.value = responsepackage;
//     packageDataDetailsList.value = packageDataDetailsList.reversed.toList();
//     print(responsepackage);

//     List<PackagesDetails> packageDetailsList = responseAsList
//         .map((userData) => PackagesDetails(
//               p_id: userData['id'],
//               packageName: userData['package_name'],
//             ))
//         .toList();
//     return packageDataDetailsList.value;
//   }
// }
