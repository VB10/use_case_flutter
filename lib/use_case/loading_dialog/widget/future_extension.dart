import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/loading_dialog/widget/custom_laoding_dialog.dart';

extension CustomFutureExtension<T> on Future<T> {
  /// It will show a loading dialog with a text and a circular progress indicator.
  /// [BuildContext] is required to show the dialog.
  ///
  /// Returns the result of the [Future<T>].
  Future<T> makeWithLoadingDialog({
    required BuildContext context,
  }) async {
    final result =
        await CustomLoadingDialog.show(context: context, future: this);
    return result;
  }
}
