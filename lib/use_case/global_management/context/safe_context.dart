import 'package:flutter/material.dart';

mixin SafeContext<T extends StatefulWidget> on State<T> {
  void safeState(VoidCallback onOperation) {
    if (!mounted) return;
    setState(() {
      onOperation.call();
    });
  }

  void safeOperation(VoidCallback onOperation) {
    if (!mounted) return;
    onOperation.call();
  }

  @override
  void setState(VoidCallback fn) {
    if (!mounted) return;
    super.setState(fn);
  }
}
