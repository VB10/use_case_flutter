import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

final class ExitAlertDialog extends StatelessWidget {
  const ExitAlertDialog({super.key});

  static Future<bool?> show(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => const ExitAlertDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit'),
      content: const Text('Are you sure you want to exit'),
      actions: [
        TextButton(
          onPressed: () {
            context.route.pop(true);
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
