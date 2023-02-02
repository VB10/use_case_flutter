import 'package:flutter/material.dart';

abstract class SocialAdapter {
  Future<String?> make();
  SocialAdapterModel get model;
}

class SocialAdapterModel {
  SocialAdapterModel({
    required this.title,
    required this.color,
    required this.icon,
  });

  factory SocialAdapterModel.facebook() => SocialAdapterModel(
        title: 'Facebbok',
        color: const Color(0xFF3B5998),
        icon: Icons.facebook,
      );

  factory SocialAdapterModel.google() => SocialAdapterModel(
        title: 'Google',
        color: const Color(0xFFDD4B39),
        icon: Icons.facebook,
      );

  factory SocialAdapterModel.apple() => SocialAdapterModel(
        title: 'Apple',
        color: Colors.black,
        icon: Icons.facebook,
      );

  factory SocialAdapterModel.microsoft() => SocialAdapterModel(
        title: 'Microsoft',
        color: Colors.black,
        icon: Icons.wordpress,
      );

  final String title;
  final Color color;
  final IconData icon;
}

class FacebookAdapter implements SocialAdapter {
  @override
  Future<String?> make() async {
    return toString();
  }

  @override
  final SocialAdapterModel model = SocialAdapterModel.facebook();
}

class GoogleAdapter implements SocialAdapter {
  @override
  Future<String?> make() async {
    throw Exception('Google is not supported this device $this');
  }

  @override
  final SocialAdapterModel model = SocialAdapterModel.google();
}

class AppleAdapter implements SocialAdapter {
  @override
  Future<String?> make() async {
    return toString();
  }

  @override
  final SocialAdapterModel model = SocialAdapterModel.apple();
}

class MicrosoftAdapter implements SocialAdapter {
  @override
  Future<String?> make() async {
    // MARK: todo microsoft login bussines
    return toString();
  }

  @override
  final SocialAdapterModel model = SocialAdapterModel.microsoft();
}
