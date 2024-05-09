import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/custom_form_field/widget/custom_form_keys.dart';
import 'package:use_case_flutter/use_case/custom_form_field/widget/custom_form_sheet.dart';

class SheetFormField extends FormField<bool> {
  SheetFormField({
    super.key,
  }) : super(
          validator: (bool? value) => value ?? false ? null : '',
          builder: (FormFieldState<bool> state) {
            return Row(
              children: [
                if (state.hasError) const Icon(Icons.error, color: Colors.red),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      if (state.isValid) return;

                      final response =
                          await CustomFormSheet.show(state.context);
                      state.didChange(response ?? false);
                    },
                    child: const Text(
                      CustomFormKeys.readThisForm,
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
}
