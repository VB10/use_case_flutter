import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/advanced_inherited/advaned_inherited_state.dart';

class AdvancedInherited extends InheritedWidget {
  const AdvancedInherited({
    required super.child,
    required this.data,
    super.key,
  });

  final AdvancedInheritedState data;

  /// Get current state of AdvancedInheritedState
  static AdvancedInheritedState of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AdvancedInherited>();
    if (result == null) {
      throw Exception('Could not find InheritedWidget');
    }
    return result.data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
