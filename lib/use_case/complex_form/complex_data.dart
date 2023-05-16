// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class ComplexData {
  const ComplexData({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.phoneNumber,
  });
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? phoneNumber;

  ComplexData copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? phoneNumber,
  }) {
    return ComplexData(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  bool operator ==(covariant ComplexData other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.confirmPassword == confirmPassword &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ password.hashCode ^ confirmPassword.hashCode ^ phoneNumber.hashCode;
  }
}
