import 'package:follow_up/Shared/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'login_details.g.dart';

@HiveType(typeId: 0)
class LoginDetails {
  @HiveField(0)
  final String token;
  @HiveField(1)
  final String userName;

  LoginDetails({
    required this.token,
    required this.userName,
  });
}

class LoginDetailsDB {
  static final LoginDetailsDB _singleton = LoginDetailsDB._internal();
  late Box<LoginDetails> box;
  factory LoginDetailsDB() {
    return _singleton;
  }

  init() async {
    box = await Hive.openBox<LoginDetails>(LOGINDETAILSBOX);
  }

  close() async {
    await box.close();
    init();
  }

  LoginDetailsDB._internal();
}
