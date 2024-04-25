import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/packages.dart';
import 'package:get/get.dart';

class PackageController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxList<PackagesDetails> packageDetailsList = <PackagesDetails>[].obs;
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
    final box = PackageDetailsDB().box;

    packageDetailsList.value = box.values.toList();

    packageDetailsList.value = packageDetailsList.reversed.toList();

    update();
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

  // Future<void> viewUser() async {
  //   LoginController loginController = Get.find();
  //   var headers = loginController.getHeaders();

  //   var body = {'package_id': packageid.value};
  //   var requestBody = jsonEncode(body);

  //   try {
  //     var response = await baseClient.postRequest(
  //         'view-package/${packageid.value}', headers, requestBody);

  //     print('objectresponse');
  //     print(response);
  //     print('requestBody');
  //     print(requestBody);
  //     print('response');

  //     // Verify response and handle accordingly
  //     if (response != null &&
  //         response is Map &&
  //         response.containsKey('package_name')) {
  //       PackageNamecontroller.text = response['package_name'];
  //       Durationcontroller.text = response['subscr_type'] ?? '';
  //       periodcontroller.text = response['subscr_period']?.toString() ?? '';
  //       Descriptioncontroller.text = response['description'] ?? '';
  //       Amountcontroller.text = response['amount']?.toString() ?? '';
  //       paymenttypecontroller.text = response['payment_type'] ?? '';
  //     } else {
  //       // Handle case when response is null or doesn't contain expected keys
  //       // For example, set default values for text controllers or show an error message
  //       PackageNamecontroller.text = '';
  //       Durationcontroller.text = '';
  //       periodcontroller.text = '';
  //       Descriptioncontroller.text = '';
  //       Amountcontroller.text = '';
  //       paymenttypecontroller.text = '';
  //     }
  //   } catch (e) {
  //     // Handle error, such as displaying an error message to the user
  //     print('Error fetching package data: $e');
  //     // Handle case when request fails, set default values for text controllers or show an error message
  //     PackageNamecontroller.text = '';
  //     Durationcontroller.text = '';
  //     periodcontroller.text = '';
  //     Descriptioncontroller.text = '';
  //     Amountcontroller.text = '';
  //     paymenttypecontroller.text = '';
  //   }
  // }
}
