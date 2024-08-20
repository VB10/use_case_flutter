import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/back_to_form/mixin/back_to_form_mixin.dart';
import 'package:use_case_flutter/use_case/back_to_form/model/back_to_form_state.dart';
import 'package:use_case_flutter/use_case/custom_form_field/widget/form_field/check_box_form_field.dart';

part 'model/back_to_form_items.dart';

final class BackToFormView extends StatefulWidget {
  const BackToFormView({super.key});
  @override
  State<BackToFormView> createState() => _BackToFormViewState();
}

class _BackToFormViewState extends State<BackToFormView> with BackToFormMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _BackToFormItems.appBarColor,
      ),
      body: ValueListenableBuilder<BackToFormState>(
        valueListenable: formStateNotifier,
        builder: (context, value, child) {
          return Form(
            key: formKey,
            canPop: value.isFormEmpty,
            onChanged: onFormChangeListen,
            onPopInvokedWithResult: (didPop, result) => onPopInvokedWithResult(
              didPop: didPop,
              result: result,
            ),
            child: Padding(
              padding: _BackToFormItems.pagePadding,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(hintText: _BackToFormItems.name),
                    validator: validate,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: _BackToFormItems.email),
                    controller: emailController,
                    validator: validate,
                  ),
                  CheckBoxFormField(
                    title: _BackToFormItems.userAgreement,
                    onChanged: (value) {
                      updateUserAgreement(value: value);
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: !value.isFormValid ? null : () {},
                    child: const Center(child: Text(_BackToFormItems.complete)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
