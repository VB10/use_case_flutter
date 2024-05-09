import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/custom_form_field/custom_form_view_mixin.dart';
import 'package:use_case_flutter/use_case/custom_form_field/custom_validator.dart';
import 'package:use_case_flutter/use_case/custom_form_field/widget/custom_form_keys.dart';
import 'package:use_case_flutter/use_case/custom_form_field/widget/form_field/check_box_form_field.dart';
import 'package:use_case_flutter/use_case/custom_form_field/widget/form_field/sheet_form_field.dart';

class CustomFromView extends StatefulWidget {
  const CustomFromView({super.key});
  @override
  State<CustomFromView> createState() => _CustomFromViewState();
}

class _CustomFromViewState extends State<CustomFromView>
    with CustomFormViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CustomFormKeys.title),
      ),
      body: Form(
        key: customFormKey,
        onChanged: onFormChange,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              const _FirstNameController(),
              const _LastNameController(),
              SheetFormField(),
              CheckBoxFormField(
                title: CustomFormKeys.agree,
              ),
              _SubmitButton(formValidateNotifier: formValidateNotifier),
            ],
          ),
        ),
      ),
    );
  }
}

class _FirstNameController extends StatelessWidget {
  const _FirstNameController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) => CustomValidator(value: value).emptyCheck,
      decoration: const InputDecoration(
        labelText: CustomFormKeys.firstName,
      ),
    );
  }
}

final class _LastNameController extends StatelessWidget {
  const _LastNameController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) => CustomValidator(value: value).emptyCheck,
      decoration: const InputDecoration(
        labelText: CustomFormKeys.lastName,
      ),
    );
  }
}

final class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.formValidateNotifier,
  });

  final ValueNotifier<bool> formValidateNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: formValidateNotifier,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: !value
              ? null
              : () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Form is valid'),
                    ),
                  );
                },
          child: const Text('Submit'),
        );
      },
    );
  }
}
