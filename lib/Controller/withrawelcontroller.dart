import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';

import 'package:follow_up/Model/withdrawel.dart';
import 'package:get/get.dart';

class WithdrawelController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxList<WithdrawelDetails> withdrawelDetailsList = <WithdrawelDetails>[].obs;
  RxList withdraw = [].obs;

  set selectedwithdrawel(WithdrawelDetails selectedwithdrawel) {}

  Future<void> addWithrawel({
    required status,
    required date,
    required userid,
    required amount,
    required w_id,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();
    WithdrawelDetails? selectedwithdrawel;

    var body = {
      "id": w_id,
      "amount": amount,
      "packageName": status,
      "user_id": userid,
      "date": date,
    };
    var response =
        await baseClient.getRequest('view-withdrawal-request', headers);

    updateWithdrawelList();
  }

  void updateWithdrawelList() {
    final box = WithdrawelDetailsDB().box;

    withdrawelDetailsList.value = box.values.toList();

    withdrawelDetailsList.value = withdrawelDetailsList.reversed.toList();

    box.values.forEach((element) {
      withdraw.add(element.amount);
      withdraw.add(element.date);
      withdraw.add(element.status);
      withdraw.add(element.w_id);
      withdraw.add(element.user_id);
    });

    update();
    // refresh();
  }

  @override
  void onInit() {
    updateWithdrawelList();
    super.onInit();
  }
}
