import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/advanced_inherited/model/advanced_inherited_model.dart';

class EmptyInheritedView extends StatefulWidget {
  const EmptyInheritedView({this.user, super.key});
  final EmptySampleInheritedUser? user;
  @override
  State<EmptyInheritedView> createState() => _EmptyInheritedViewState();
}

class _EmptyInheritedViewState extends State<EmptyInheritedView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> formValidateNotifier = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
    userNameController.text = widget.user?.userName ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        onChanged: _checkFormValidate,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _UserNameRow(
                userNameController: userNameController,
                widget: widget,
              ),
              _RandomButtonRow(emailController: emailController),
              _PasswordRow(
                passwordController: passwordController,
                onTapOutside: () {},
              ),
              ValueListenableBuilder(
                valueListenable: formValidateNotifier,
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: !value
                        ? null
                        : () {
                            final userRequest = EmptySampleUserRequest(
                              email: emailController.text,
                              password: passwordController.text,
                              userName: userNameController.text,
                            );
                            print(userRequest);
                          },
                    child: const Text('On Complete'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkFormValidate() {
    formValidateNotifier.value = formKey.currentState?.validate() ?? false;
  }
}

class _UserNameRow extends StatelessWidget {
  const _UserNameRow({
    required this.userNameController,
    required this.widget,
  });

  final TextEditingController userNameController;
  final EmptyInheritedView widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: userNameController,
          validator: (String? value) => value?.isEmpty ?? true ? 'Empty' : null,
          decoration: const InputDecoration(
            labelText: 'User Name',
          ),
        ),
        TextButton(
          onPressed: () {
            userNameController.text = widget.user?.userName ?? '';
          },
          child: const Text('Make a default'),
        ),
      ],
    );
  }
}

class _RandomButtonRow extends StatelessWidget {
  const _RandomButtonRow({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _RandomEmailButton(emailController: emailController),
        Expanded(
          child: TextFormField(
            validator: (String? value) =>
                value?.isEmpty ?? true ? 'Empty' : null,
            controller: emailController,
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
  const _RandomEmailButton({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        emailController.text = 'random@gmail.com';
      },
      icon: const Text('Random'),
    );
  }
}

class _PasswordRow extends StatelessWidget {
  const _PasswordRow({
    required this.passwordController,
    required this.onTapOutside,
  });

  final TextEditingController passwordController;
  final VoidCallback onTapOutside;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onTapOutside: (event) => onTapOutside.call(),
            validator: (String? value) =>
                value?.isEmpty ?? true ? 'Empty' : null,
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
        ),
        _PasswordClear(passwordController: passwordController),
      ],
    );
  }
}

class _PasswordClear extends StatelessWidget {
  const _PasswordClear({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: passwordController.clear,
      child: const Text('Clear password'),
    );
  }
}
