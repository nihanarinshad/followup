import 'package:follow_up/Shared/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_details.g.dart';

@HiveType(typeId: 1)
class UserDetails {
  @HiveField(0)
  final int user_id;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final DateTime dateTime;
  UserDetails({
    required this.user_id,
    required this.username,
    required this.dateTime,
  });
}

class UserDetailsDB {
  static final UserDetailsDB _singleton = UserDetailsDB._internal();
  late Box<UserDetails> box;
  factory UserDetailsDB() {
    return _singleton;
  }

  init() async {
    box = await Hive.openBox<UserDetails>(USERDETAILSBOX);
  }

  close() async {
    await box.close();
    init();
  }

  UserDetailsDB._internal();
}
