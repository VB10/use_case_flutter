import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

final class HomeStyle {
  HomeStyle({required BuildContext context}) : _context = context;

  final BuildContext _context;

  /// Color value is [ColorScheme.surface]
  Color get appBarColor => _context.general.colorScheme.surface;

  /// TextStyle value is [TextTheme.displaySmall]
  TextStyle get appBarTitleStyle =>
      _context.general.textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.w300,
      ) ??
      const TextStyle();

  /// EdgeInsets value is [EdgeInsets.symmetric(horizontal: 16)]
  static const EdgeInsets appBarPadding = EdgeInsets.symmetric(horizontal: 16);
}
