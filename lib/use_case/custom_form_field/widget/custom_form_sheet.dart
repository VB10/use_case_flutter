import 'package:flutter/material.dart';

final class CustomFormSheet extends StatelessWidget {
  const CustomFormSheet({super.key});

  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      builder: (BuildContext context) {
        return const CustomFormSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Please read this form' * 20),
        IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(Icons.check_outlined),
        ),
      ],
    );
  }
}
