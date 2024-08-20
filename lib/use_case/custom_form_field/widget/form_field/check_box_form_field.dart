import 'package:flutter/material.dart';

class CheckBoxFormField extends FormField<bool> {
  CheckBoxFormField({
    required String title,
    ValueChanged<bool>? onChanged,
    super.key,
  }) : super(
          initialValue: false,
          validator: (bool? value) => value ?? false ? null : '',
          builder: (FormFieldState<bool> state) {
            return Row(
              children: [
                if (state.hasError) const Icon(Icons.error, color: Colors.red),
                Expanded(
                  child: CheckboxListTile(
                    title: Text(title),
                    value: state.value ?? false,
                    onChanged: (value) {
                      state.didChange(value);
                      onChanged?.call(value ?? false);
                    },
                  ),
                ),
              ],
            );
          },
        );
}
