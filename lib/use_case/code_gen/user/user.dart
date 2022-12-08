import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User extends Equatable {
  const User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.code,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static List<User> get users => List.generate(
        10,
        (index) => User(
          name: 'users_$index',
        ),
      );

  final int? id;
  @JsonKey(name: 'naMe')
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;
  final StatusCode? code;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      username,
      email,
      phone,
      website,
      code,
    ];
  }
}

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue('500')
  weird,
}
