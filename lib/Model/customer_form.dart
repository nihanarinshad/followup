import 'package:follow_up/Shared/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'customer_form.g.dart';


class CustomerformDetails {
  @HiveField(0)
  final int id;
  final String formname;

  final String fieldname;
  final String feildtype;
  final String defaultvalue;
  final String required;
  final String includedreg;
  final int modifiedby;
  CustomerformDetails(
      {required this.id,
      required this.formname,
      required this.fieldname,
      required this.feildtype,
      required this.defaultvalue,
      required this.required,
      required this.includedreg,
      required this.modifiedby});
}

class CustomerformDetailsDB {
  static final CustomerformDetailsDB _singleton =
      CustomerformDetailsDB._internal();
  late Box<CustomerformDetails> box;
  factory CustomerformDetailsDB() {
    return _singleton;
  }

  init() async {
    box = await Hive.openBox<CustomerformDetails>(form);
  }

  close() async {
    await box.close();
    init();
  }

  CustomerformDetailsDB._internal();
}
