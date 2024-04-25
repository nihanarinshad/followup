import 'package:follow_up/Shared/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'packages.g.dart';

@HiveType(typeId: 6)
class PackagesDetails {
  @HiveField(0)
  final int p_id;
  @HiveField(1)
  final String packageName;

  PackagesDetails({
    required this.p_id,
    required this.packageName,
  });
}

class PackageDetailsDB {
  static final PackageDetailsDB _singleton = PackageDetailsDB._internal();
  late Box<PackagesDetails> box;
  factory PackageDetailsDB() {
    return _singleton;
  }

  init() async {
    box = await Hive.openBox<PackagesDetails>(PACKAGESBOX);
  }

  close() async {
    await box.close();
    init();
  }

  PackageDetailsDB._internal();
}
