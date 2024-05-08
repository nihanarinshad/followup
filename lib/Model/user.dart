import 'package:follow_up/Shared/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserDetails {
  final int id;
  final String username;

  UserDetails({required this.id, required this.username});
}
