import 'package:follow_up/Shared/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'withdrawel.g.dart';

@HiveType(typeId: 9)
class WithdrawelDetails {
  @HiveField(0)
  final int w_id;
  @HiveField(1)
  final int amount;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final String status;
  @HiveField(4)
  final int user_id;

  WithdrawelDetails(
      {required this.w_id,
      required this.amount,
      required this.date,
      required this.status,
      required this.user_id});
}

class WithdrawelDetailsDB {
  static final WithdrawelDetailsDB _singleton = WithdrawelDetailsDB._internal();
  late Box<WithdrawelDetails> box;
  factory WithdrawelDetailsDB() {
    return _singleton;
  }

  init() async {
    box = await Hive.openBox<WithdrawelDetails>(WITHRAWEL);
  }

  close() async {
    await box.close();
    init();
  }

  WithdrawelDetailsDB._internal();
}
