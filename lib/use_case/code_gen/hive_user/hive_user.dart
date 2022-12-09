import 'package:hive/hive.dart';
import 'package:use_case_flutter/use_case/code_gen/hive_user/hive_constants.dart';

part 'hive_user.g.dart';

@HiveType(typeId: HiveConstants.hiveUser)
class HiveUser extends HiveObject {
  HiveUser(this.id, this.count);

  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? count;
}
