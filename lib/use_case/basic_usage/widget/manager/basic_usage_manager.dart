import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/advanced_inherited/advaned_inherited_state.dart';
import 'package:use_case_flutter/use_case/basic-mvvm/basic_view.dart';

abstract class BasicUsageManagerInterface {
  void showPlusSnackMessage();
  void onCardBodyPressWithNavigate();
}

final class BasicUsageManager implements BasicUsageManagerInterface {
  BasicUsageManager({required BuildContext context}) : _context = context;

  final BuildContext _context;

  @override

  /// Show a snack message [Add Item]
  void showPlusSnackMessage() {
    ScaffoldMessenger.of(_context)
        .showSnackBar(const SnackBar(content: Text('Add Item')));
  }

  @override

  /// Navigate to [BasicView]
  void onCardBodyPressWithNavigate() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (context) => const AdvancedInheritedProvider(),
      ),
    );
  }
}
