import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:use_case_flutter/use_case/back_to_form/back_to_form_view.dart';

class BackToFormHome extends StatelessWidget {
  const BackToFormHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.route.navigateToPage(const BackToFormView());
        },
        label: const Text('Navigate to Form'),
      ),
    );
  }
}
