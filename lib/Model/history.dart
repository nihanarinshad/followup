import 'package:follow_up/Shared/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'history.g.dart';

@HiveType(typeId: 11)
class HistoryDetails {
  @HiveField(0)
  final int h_id;
  @HiveField(1)
  final String comments;
  @HiveField(2)
  final DateTime nextappoinmentdate;
  @HiveField(3)
  final String status_name;
  @HiveField(4)
  final DateTime appoinmentdate;
  HistoryDetails({
    required this.h_id,
    required this.comments,
    required this.nextappoinmentdate,
    required this.status_name,
    required this.appoinmentdate,
  });
}

class HistoryDetailsDB {
  static final HistoryDetailsDB _singleton = HistoryDetailsDB._internal();
  late Box<HistoryDetails> box;
  factory HistoryDetailsDB() {
    return _singleton;
  }

  init() async {
    box = await Hive.openBox<HistoryDetails>(History);
  }

  close() async {
    await box.close();
    init();
  }

  HistoryDetailsDB._internal();
}
