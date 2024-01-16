import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/view_mixin/parent_home_view.dart';

enum ParentHomeResult {
  first,
  second,
  third,
}

mixin ParentHomeViewMixin on State<ParentHomeView> {
  void showDialogForType(ParentHomeResult value);
  void showProgress(bool value);

  Future<void> sendRequestForService() async {
    showProgress(true);
    final response = await _callService();
    showProgress(false);

    if (!mounted) return;
    await _showDialogForServiceResponse(response);
    setState(() {});
  }

  /// This method is used to call the service.
  /// first is mean purple
  Future<ParentHomeResult> _callService() async {
    final response = await Future.any<ParentHomeResult>([
      Future.delayed(const Duration(seconds: 2), () => ParentHomeResult.first),
      Future.delayed(const Duration(seconds: 2), () => ParentHomeResult.second),
      Future.delayed(const Duration(seconds: 2), () => ParentHomeResult.third),
    ]);

    return response;
  }

  /// decide for home response
  Future<void> _showDialogForServiceResponse(ParentHomeResult data) async {
    // showDialogForType(data);
    switch (data) {
      case ParentHomeResult.first:
        showDialogForType(ParentHomeResult.first);
        break;
      case ParentHomeResult.second:
        showDialogForType(ParentHomeResult.second);
        break;
      case ParentHomeResult.third:
        showDialogForType(ParentHomeResult.third);
        break;
    }
  }
}
