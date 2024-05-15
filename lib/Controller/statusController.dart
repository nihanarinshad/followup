import 'dart:convert';

import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/status_details.dart';
import 'package:get/get.dart';

class StatusController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxList<StatusDetails> statusDetailsList = <StatusDetails>[].obs;
  LoginController loginController = Get.find();
  RxInt statusid = 0.obs;
  RxList dropDownList = [].obs;
  RxList statusList = [].obs;

  set selectedStatus(StatusDetails selectedStatus) {}

  Future<void> addStatus({
    required String status,
    required String final_status,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();
    StatusDetails? selectedStatus;
    print('response');

    var body = {"status_name": status, "final_status": final_status};
    var requestBody = jsonEncode(body);
    print(body);
    var response =
        await baseClient.postRequest('add-status-field', headers, requestBody);
    print(response);
    updateStatusList();
  }

  void updateStatusList() {
    // refresh();
  }

  @override
  void onInit() {
    updateStatusList();
    super.onInit();
  }

  Future<void> editStatus({
    required String status,
    required String final_status,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();
    StatusDetails? selectedStatus;

    var body = {"new_status_name": status, "final_status": final_status};
    var requestBody = jsonEncode(body);
    var response = await baseClient.putRequest(
        'edit-status-field/${statusid.value}', headers, requestBody);
    print('response');
    print(body);
    print(response);
    print('response');
  }

  Future<List> StatusListView() async {
    var loginHeader = loginController.getHeaders();

    var response = await baseClient.getRequest(
      'list-status-field',
      loginHeader,
    );

    List responseAsList = response;
    statusList.value = response;
    statusList.value = statusList.reversed.toList();
    print(response);

    List<StatusDetails> userDetailsList = responseAsList
        .map((userData) => StatusDetails(
              s_Id: userData['id'],
              status: userData['status_name'],
            ))
        .toList();
    return statusList.value;
  }
}
