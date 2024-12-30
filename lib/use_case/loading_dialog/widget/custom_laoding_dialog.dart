import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// It will show a loading dialog with a text and a circular progress indicator.
final class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key});

  /// It will show a loading dialog with a text and a circular progress indicator.
  /// [BuildContext] is required to show the dialog.
  /// [Future] is required to complete dialog.
  ///
  /// Returns the result of the [Future<T>].
  static Future<T> show<T>({
    required BuildContext context,
    required Future<T> future,
  }) async {
    unawaited(
      showDialog(
        context: context,
        builder: (context) => const CustomLoadingDialog(),
      ),
    );
    final result = await future;
    if (context.mounted) {
      await context.route.pop();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_CustomLoadingItems._loadingText),
          SizedBox(height: _CustomLoadingItems._space),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}

final class _CustomLoadingItems {
  static const double _space = 16;
  static const String _loadingText = 'Loading...';
}
