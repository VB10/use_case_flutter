import 'package:flutter/material.dart';

import '../radius/circular_custom_radius.dart';

class ButtonDecoration extends BoxDecoration {
  /// gradient color use [colorScheme.error] and on [  colorScheme.onSurface]
  ButtonDecoration(ColorScheme colorScheme)
      : super(
            borderRadius: CustomRadius.circular(),
            gradient: LinearGradient(colors: [
              colorScheme.error,
              colorScheme.onSurface,
            ]));
}
