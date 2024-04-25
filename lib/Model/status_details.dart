import 'package:follow_up/Shared/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'status_details.g.dart';

@HiveType(typeId: 3)
class StatusDetails {
  @HiveField(0)
  final int s_Id;
  @HiveField(1)
  final String status;

  StatusDetails({
    required this.s_Id,
    required this.status,
  });
}

class StatusDetailsDB {
  static final StatusDetailsDB _singleton = StatusDetailsDB._internal();
  late Box<StatusDetails> box;
  factory StatusDetailsDB() {
    return _singleton;
  }

  init() async {
    box = await Hive.openBox<StatusDetails>(STATUSBOX);
  }

  close() async {
    await box.close();
    init();
  }

  StatusDetailsDB._internal();
}
