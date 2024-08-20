import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:use_case_flutter/use_case/back_to_form/widget/exit_alert_dialog.dart';

final class GeneralForm extends StatelessWidget {
  const GeneralForm({
    required this.formKey,
    required this.onChange,
    required this.child,
    required this.canPop,
    super.key,
  });
  final GlobalKey<FormState> formKey;
  final bool canPop;
  final VoidCallback onChange;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      canPop: canPop,
      onChanged: onChange,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final response = await ExitAlertDialog.show(context);
        if (response == null || !response) return;
        context.route.popWithRoot();
      },
      child: child,
    );
  }
}
