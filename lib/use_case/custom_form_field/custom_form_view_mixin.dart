import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/custom_form_field/custom_form_view.dart';

mixin CustomFormViewMixin on State<CustomFromView> {
  /// Form key for using form validation
  final GlobalKey<FormState> customFormKey = GlobalKey<FormState>();

  /// Form validation notifier
  final ValueNotifier<bool> formValidateNotifier = ValueNotifier<bool>(false);

  /// Form change notifier to validate the form
  void onFormChange() {
    formValidateNotifier.value =
        customFormKey.currentState?.validate() ?? false;
  }
}
