import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

mixin ShowSheetMixin {
  static Future<T?> showCustomSheet<T>({
    required BuildContext context,
    required Widget child,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      shape: const RoundedRectangleBorder(),
      builder: (context) {
        return Column(
          children: [
            const _Header(),
            Expanded(child: child),
          ],
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 2),
        SizedBox(
          width: context.sized.dynamicWidth(0.3),
          child: const Divider(thickness: 10),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            context.route.pop();
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
