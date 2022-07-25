import 'package:flutter/material.dart';

class ClearTextAction extends Action<ClearTextIntent> {
  String text = '';
  @override
  void invoke(ClearTextIntent intent) {
    final value = intent.text;
    if (value != null && value.isNotEmpty) {
      text = value;
    } else {
      text = '';
    }
    notifyActionListeners();
  }
}

class ClearTextIntent extends Intent {
  final String? text;

  const ClearTextIntent({this.text});
}
