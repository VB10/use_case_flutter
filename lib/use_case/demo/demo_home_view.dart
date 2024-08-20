import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DemoHome1 extends StatelessWidget {
  const DemoHome1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.route.navigateToPage(const DemoHomeView());
        },
      ),
    );
  }
}

class DemoHomeView extends StatefulWidget {
  const DemoHomeView({super.key});
  @override
  State<DemoHomeView> createState() => _DemoHomeViewState();
}

class _DemoHomeViewState extends State<DemoHomeView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool get isEmpty =>
      _controllerUserName.text.isEmpty || _controllerPassword.text.isEmpty;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: Form(
        key: formKey,
        onChanged: () {
          setState(() {});
        },
        canPop: isEmpty,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;

          final response = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    icon: const Icon(Icons.check),
                  ),
                ],
              );
            },
          );

          if (response == null || !response) return;
          context.route.popWithRoot();
        },
        child: Column(
          children: [
            TextFormField(
              controller: _controllerUserName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _controllerPassword,
              decoration: const InputDecoration(
                labelText: 'Enter your email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
