import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/loading_dialog/widget/future_extension.dart';

class CustomLoadingDialogView extends StatefulWidget {
  const CustomLoadingDialogView({super.key});

  @override
  State<CustomLoadingDialogView> createState() =>
      _CustomLoadingDialogViewState();
}

class _CustomLoadingDialogViewState extends State<CustomLoadingDialogView> {
  Future<String> _sampleServiceRequest() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'test';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await _sampleServiceRequest()
              .makeWithLoadingDialog(context: context);
          print(response);
        },
        child: const Text('Show Loading Dialog'),
      ),
    );
  }
}
