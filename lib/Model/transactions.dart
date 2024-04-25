import 'package:follow_up/Shared/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'transactions.g.dart';

@HiveType(typeId: 7)
class TransactionDetails {
  @HiveField(0)
  final int t_id;
  @HiveField(1)
  final int amount;
  @HiveField(2)
  final DateTime date;

  TransactionDetails({
    required this.date,
    required this.t_id,
    required this.amount,
  });
}

class TransactionDetailsDB {
  static final TransactionDetailsDB _singleton =
      TransactionDetailsDB._internal();
  late Box<TransactionDetails> box;
  factory TransactionDetailsDB() {
    return _singleton;
  }

  init() async {
    box = await Hive.openBox<TransactionDetails>(TRANSACTIONBOX);
  }

  close() async {
    await box.close();
    init();
  }

  TransactionDetailsDB._internal();
}
