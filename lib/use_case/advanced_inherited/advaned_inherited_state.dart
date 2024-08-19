import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/advanced_inherited/advanced_form_inherited.dart';
import 'package:use_case_flutter/use_case/advanced_inherited/advanced_inherited.dart';
import 'package:use_case_flutter/use_case/advanced_inherited/model/advanced_inherited_model.dart';

final class AdvancedInheritedProvider extends StatefulWidget {
  const AdvancedInheritedProvider({super.key, this.user});
  final EmptySampleInheritedUser? user;

  @override
  State<AdvancedInheritedProvider> createState() => AdvancedInheritedState();
}

class AdvancedInheritedState extends State<AdvancedInheritedProvider>
    with _AdvancedInheritedStateMixin {
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
    return AdvancedInherited(
      data: this,
      child: const AdvancedFormInherited(),
    );
  }
}

mixin _AdvancedInheritedStateMixin on State<AdvancedInheritedProvider> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> formValidateNotifier = ValueNotifier<bool>(false);

  /// for backend request
  EmptySampleUserRequest get userRequest => EmptySampleUserRequest(
        email: emailController.text,
        password: passwordController.text,
        userName: userNameController.text,
      );

  /// Clear password controller value
  void clearPasswordField() {
    passwordController.clear();
  }

  void onTopOutSide() {
    /// show dialog
  }

  /// Update email to randomly
  /// now it will show as 'random@gmail.com'
  void updateEmailRandom() {
    emailController.text = 'random@gmail.com';
  }

  /// update user field name to [widget.user.userName]
  void updateUserFieldNameToDefault() {
    userNameController.text = widget.user?.userName ?? '';
  }

  /// Check form validate for password, email, and username
  /// if all of them are valid, then it will return true
  void checkFormValidate() {
    formValidateNotifier.value = formKey.currentState?.validate() ?? false;
  }
}
