import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'package:use_case_flutter/use_case/code_gen/hive_user/hive_constants.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserF with _$UserF {
  @HiveType(typeId: HiveConstants.hiveF)
  factory UserF(
    @HiveField(0) int? statusCode,
    @HiveField(1) String? id,
  ) = _UserF;

  factory UserF.fromJson(Map<String, Object?> json) => _$UserFFromJson(json);
}

class Sample {
  void name() {
    final userf = UserF(5, null);
    userf.copyWith(id: 'a');
  }
}
