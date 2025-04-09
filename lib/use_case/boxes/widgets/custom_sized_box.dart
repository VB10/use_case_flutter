import 'package:flutter/material.dart';

final class EmptySizedBoxWidth extends SizedBox {
  const EmptySizedBoxWidth._();

  /// Small: 8
  const EmptySizedBoxWidth.small({super.key}) : super(width: 8);

  /// Medium: 16
  const EmptySizedBoxWidth.medium({super.key}) : super(width: 16);

  /// Large: 24
  const EmptySizedBoxWidth.large({super.key}) : super(width: 24);
}

final class EmptySizedBoxHeight extends SizedBox {
  const EmptySizedBoxHeight._();

  /// Small: 8
  const EmptySizedBoxHeight.small({super.key}) : super(height: 8);

  /// Medium: 16
  const EmptySizedBoxHeight.medium({super.key}) : super(height: 16);

  /// Large: 24
  const EmptySizedBoxHeight.large({super.key}) : super(height: 24);
}
