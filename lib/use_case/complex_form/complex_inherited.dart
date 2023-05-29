part of 'complex_form_view.dart';

class ComplexInherited extends InheritedWidget {
  ComplexInherited({
    required super.child,
    super.key,
    this.complexData,
  }) : emailController = TextEditingController(text: complexData?.email);

  final ComplexData? complexData;
  final TextEditingController nameController = TextEditingController(text: 'vb');
  final TextEditingController emailController;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  bool updateShouldNotify(covariant ComplexInherited oldWidget) {
    return oldWidget.complexData != complexData;
  }

  ComplexData? controlAndReturn() {
    if (formKey.currentState?.validate() ?? false) {
      return ComplexData(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phoneNumber: phoneNumberController.text,
      );
    }
    return null;
  }

  static ComplexInherited of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ComplexInherited>();
    assert(result != null, 'No ComplexInherited found in context');
    return result!;
  }
}
