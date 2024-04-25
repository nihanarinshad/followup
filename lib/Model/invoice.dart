import 'package:follow_up/Shared/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'invoice.g.dart';

@HiveType(typeId: 8)
class InvoiceDetails {
  @HiveField(0)
  final int iv_id;
  @HiveField(1)
  final int amount;
  @HiveField(2)
  final String packageName;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final int userid;
  @HiveField(5)
  final String userName;

  InvoiceDetails({
    required this.packageName,
    required this.date,
    required this.userid,
    required this.userName,
    required this.amount,
    required this.iv_id,
  });
}

class InvoiceDetailsDB {
  static final InvoiceDetailsDB _singleton = InvoiceDetailsDB._internal();
  late Box<InvoiceDetails> box;
  factory InvoiceDetailsDB() {
    return _singleton;
  }

  init() async {
    box = await Hive.openBox<InvoiceDetails>(INVOICE);
  }

  close() async {
    await box.close();
    init();
  }

  InvoiceDetailsDB._internal();
}
