import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/customer_form.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerFormController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxList<CustomerformDetails> CustomerformDetailsList =
      <CustomerformDetails>[].obs;
  RxList custumerFormList = [].obs;

  RxInt studentid = 0.obs;
  TextEditingController fieldname = TextEditingController();
  TextEditingController fieldType = TextEditingController();

  TextEditingController defaultvalue = TextEditingController();

  TextEditingController required = TextEditingController();
  TextEditingController include = TextEditingController();
  TextEditingController modefied = TextEditingController();

  DateFormat dateFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Future<void> addForm({
    required String fieldname,
    required String fieldType,
    required String defaultvalue,
    required String required,
    required String include,
    required String is_active,
  }) async {
    RxInt values = RxInt(0);

    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {
      "field_name": fieldname,
      "field_type": fieldType,
      "default_value": defaultvalue,
      "required": required,
      "include_in_reg_form": include,
      "is_active": is_active,
    };
    var requestBody = jsonEncode(body);
    print(
        'Request Body: $requestBody'); // Add this line to print the request body

    var response =
        await baseClient.postRequest('member-form-field', headers, requestBody);

    updateFormList();
  }

  void updateFormList() {}

  @override
  void onInit() {
    updateFormList();
    super.onInit();
  }

  Future<void> editStudent({
    required String field_name,
    required String defalut_value,
    required String field_type,
    required String include_in_reg_form,
    required String is_active,
    required String required,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {
      "field_name": field_name,
      "defalut_value": defalut_value,
      "field_type": field_type,
      "include_in_reg_form": include_in_reg_form,
      "is_active": is_active,
      "required": required,
    };
    var requestBody = jsonEncode(body);
    var response = await baseClient.putRequest(
        'update-member-form-field/${studentid.value}', headers, requestBody);
  }

  Future<List> viewForm() async {
    LoginController loginController = Get.find();
    var loginHeader = loginController.getHeaders();

    var response = await baseClient.getRequest(
      'view-member-form-field',
      loginHeader,
    );
    custumerFormList.value = response['items'];
    custumerFormList.value = custumerFormList.reversed.toList();
    print(custumerFormList);

    // List<CustomerformDetails> customerList = custumerFormList.map((userData) {
    //   return CustomerformDetails(
    //     id: userData['items']['id'],
    //     fieldname: userData['items']['field_name'],
    //     feildtype: userData['items']['field_type'],
    //     defaultvalue: userData['items']['default_value'],
    //     required: userData['items']['required'],
    //     includedreg: userData['items']['include_in_reg_form'],
    //   );
    // }).toList();
    return custumerFormList;
  }
}
