import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/social/core/social_adapter.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.adapter,
    required this.onCompleted,
  });
  final SocialAdapter adapter;
  final void Function(String token) onCompleted;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        // final response = await adapter.make.call();
        final response2 = await GlobalException.make<String>(adapter.make);
        if (response2 == null || response2.isEmpty) {
          // push to login view
          return;
        }
        onCompleted.call(response2);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: adapter.model.color,
      ),
      icon: Icon(adapter.model.icon),
      label: Text(adapter.model.title),
    );
  }
}

class GlobalException {
  static Future<T?> make<T>(AsyncValueGetter<T?> onOperation) async {
    try {
      final response = await onOperation.call();
      if (response == null) {
        throw Exception('$T data is null $response');
      }
      return response;
    } catch (e) {
      //logger
      print('$e');
      return null;
    }
  }
}
