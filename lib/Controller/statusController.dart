import 'dart:convert';

import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/status_details.dart';
import 'package:get/get.dart';

class StatusController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxList<StatusDetails> statusDetailsList = <StatusDetails>[].obs;
  RxList dropDownList = [].obs;

  set selectedStatus(StatusDetails selectedStatus) {}

  Future<void> addStatus({
    required String status,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();
    StatusDetails? selectedStatus;

    var body = {"status_name": status};
    var requestBody = jsonEncode(body);
    var response =
        await baseClient.postRequest('add-status-field', headers, requestBody);

    updateStatusList();
  }

  void updateStatusList() {
    final box = StatusDetailsDB().box;

    statusDetailsList.value = box.values.toList();

    statusDetailsList.value = statusDetailsList.reversed.toList();

    box.values.forEach((element) {
      dropDownList.add(element.status);
    });

    update();
    // refresh();
  }

  @override
  void onInit() {
    updateStatusList();
    super.onInit();
  }
}
