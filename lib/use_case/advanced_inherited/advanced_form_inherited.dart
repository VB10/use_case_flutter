import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/advanced_inherited/advanced_inherited.dart';
import 'package:use_case_flutter/use_case/advanced_inherited/advaned_inherited_state.dart';

extension _AdvancedContext on BuildContext {
  AdvancedInheritedState get inherited => AdvancedInherited.of(this);
}

class AdvancedFormInherited extends StatefulWidget {
  const AdvancedFormInherited({super.key});
  @override
  State<AdvancedFormInherited> createState() => _AdvancedFormInheritedState();
}

class _AdvancedFormInheritedState extends State<AdvancedFormInherited> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: context.inherited.formKey,
        onChanged: context.inherited.checkFormValidate,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              _UserNameRow(),
              _RandomButtonRow(),
              _PasswordRow(),
              _OnCompleteButton(),
            ],
          ),
        ),
      ),
    );
  }
}

final class _OnCompleteButton extends StatelessWidget {
  const _OnCompleteButton();

  @override
  Widget build(BuildContext context) {
    final currentState = AdvancedInherited.of(context);
    return ValueListenableBuilder(
      valueListenable: currentState.formValidateNotifier,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: !value
              ? null
              : () {
                  print(currentState.userRequest);
                },
          child: const Text('On Complete'),
        );
      },
    );
  }
}

final class _UserNameRow extends StatelessWidget {
  const _UserNameRow();

  @override
  Widget build(BuildContext context) {
    final currentState = AdvancedInherited.of(context);
    return Column(
      children: [
        TextFormField(
          controller: currentState.userNameController,
          validator: (String? value) => value?.isEmpty ?? true ? 'Empty' : null,
          decoration: const InputDecoration(
            labelText: 'User Name',
          ),
        ),
        TextButton(
          onPressed: currentState.updateUserFieldNameToDefault,
          child: const Text('Make a default'),
        ),
      ],
    );
  }
}

final class _RandomButtonRow extends StatelessWidget {
  const _RandomButtonRow();

  @override
  Widget build(BuildContext context) {
    final currentState = AdvancedInherited.of(context);
    return Row(
      children: [
        const _RandomEmailButton(),
        Expanded(
          child: TextFormField(
            validator: (String? value) =>
                value?.isEmpty ?? true ? 'Empty' : null,
            controller: currentState.emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
        ),
      ],
    );
  }
}

class _RandomEmailButton extends StatelessWidget {
  const _RandomEmailButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AdvancedInherited.of(context).updateEmailRandom();
      },
      icon: const Text('Random'),
    );
  }
}

final class _PasswordRow extends StatelessWidget {
  const _PasswordRow();

  @override
  Widget build(BuildContext context) {
    final currentState = AdvancedInherited.of(context);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onTapOutside: (event) => currentState.onTopOutSide(),
            validator: (String? value) =>
                value?.isEmpty ?? true ? 'Empty' : null,
            controller: currentState.passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
        ),
        const _PasswordClear(),
      ],
    );
  }
}

class _PasswordClear extends StatelessWidget {
  const _PasswordClear();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        AdvancedInherited.of(context).clearPasswordField();
      },
      child: const Text('Clear password'),
    );
  }
}
