import 'package:follow_up/Shared/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'moderator_details.g.dart';

@HiveType(typeId: 2)
class ModeratorDetails {
  @HiveField(0)
  final int m_id;
  @HiveField(1)
  final String moderatorName;

  ModeratorDetails({
    required this.m_id,
    required this.moderatorName,
  });
}

class ModeratorDetailsDB {
  static final ModeratorDetailsDB _singleton = ModeratorDetailsDB._internal();
  late Box<ModeratorDetails> box;
  factory ModeratorDetailsDB() {
    return _singleton;
  }

  init() async {
    box = await Hive.openBox<ModeratorDetails>(TENANTDETAILSBOX);
  }

  close() async {
    await box.close();
    init();
  }

  ModeratorDetailsDB._internal();
}
