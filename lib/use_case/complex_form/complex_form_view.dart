import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/complex_form/complex_data.dart';

part 'complex_inherited.dart';

class ComplexFormView extends StatefulWidget {
  const ComplexFormView({super.key});
  @override
  State<ComplexFormView> createState() => _ComplexFormViewState();
}

class _ComplexFormViewState extends State<ComplexFormView> {
  ComplexData complexData = const ComplexData(email: 'vb12');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complex Form')),
      body: ComplexInherited(
        complexData: complexData,
        child: const _BodyForm(
          onValueUpdated: print,
        ),
      ),
    );
  }
}

class _BodyForm extends StatelessWidget {
  const _BodyForm({this.onValueUpdated});
  final ValueSetter<ComplexData>? onValueUpdated;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: ComplexInherited.of(context).formKey,
      child: Column(
        children: [
          const _NameField(),
          const _EmailField(),
          const _PasswordField(),
          const _PhoneField(),
          ElevatedButton(
            onPressed: () {
              final complexData = ComplexInherited.of(context).controlAndReturn();
              if (complexData == null) return;
              print(complexData);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ComplexInherited.of(context).nameController,
      validator: (value) => value?.isEmpty ?? true ? 'Name is required' : null,
      decoration: const InputDecoration(
        labelText: 'Name',
        hintText: 'Enter your name',
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ComplexInherited.of(context).emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        counterText: '2',
      ),
    );
  }
}
