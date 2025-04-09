import 'package:flutter/material.dart';

final class CustomBoxDecoration extends BoxDecoration {
  const CustomBoxDecoration({
    super.color,
    super.borderRadius,
    super.border,
    super.gradient,
  });

  /// Main Decoration
  /// Gradient: Colors.red, Colors.blue
  /// Border Radius: 12
  const CustomBoxDecoration.main()
      : super(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          gradient: const LinearGradient(
            colors: [
              Colors.red,
              Colors.blue,
            ],
          ),
        );
}

/// Custom Box Decoration Widget
/// Gradient: Colors.red, Colors.blue
/// Border Radius: 12
/// Border: Border.all(color: Colors.grey)
/// Color: Colors.white
class CustomBoxDecorationWidget extends StatelessWidget {
  const CustomBoxDecorationWidget({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [
            Colors.red,
            Colors.blue,
          ],
        ),
      ),
      child: child,
    );
  }
}
