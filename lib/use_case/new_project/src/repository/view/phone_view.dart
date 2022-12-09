import 'package:flutter/material.dart';

import 'package:use_case_flutter/use_case/new_project/src/product/utility/luanch_utils.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({super.key});
  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> with LaunchMixins {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextButton(
        onPressed: () {
          launchPhone('900');
        },
        child: const Text('+9000000'),
      ),
    );
  }
}
