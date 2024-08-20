import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:use_case_flutter/use_case/back_to_form/back_to_form_view.dart';
import 'package:use_case_flutter/use_case/back_to_form/model/back_to_form_state.dart';
import 'package:use_case_flutter/use_case/back_to_form/widget/exit_alert_dialog.dart';

mixin BackToFormMixin on State<BackToFormView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// MARK: Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final formStateNotifier =
      ValueNotifier<BackToFormState>(const BackToFormState());

  /// MARK: Variables
  final String _emptyValidatorMessage = 'Please enter some text';
  bool _isUserAgreement = false;

  /// MARK: Getters

  BackToFormState get _formStateValue => formStateNotifier.value;
  bool get isFormEmpty =>
      nameController.text.isEmpty &&
      emailController.text.isEmpty &&
      !_isUserAgreement;

  /// Validates the given value.
  String? validate(String? value) {
    if (value.ext.isNullOrEmpty) {
      return _emptyValidatorMessage;
    }
    return null;
  }

  void onFormChangeListen() {
    formStateNotifier.value = _formStateValue.copyWith(
      isFormEmpty: isFormEmpty,
      isFormValid: formKey.currentState?.validate() ?? false,
    );
  }

  /// Updates the user agreement [value].
  /// With notify listeners.
  void updateUserAgreement({required bool value}) {
    _isUserAgreement = value;
    onFormChangeListen();
  }

  Future<void> onPopInvokedWithResult({
    required bool didPop,
    dynamic result,
  }) async {
    if (didPop) return;
    final response = await ExitAlertDialog.show(context);
    if (response == null || !response) return;
    if (!mounted) return;
    context.route.popWithRoot();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }
}
