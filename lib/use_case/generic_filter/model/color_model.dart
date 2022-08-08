import 'package:flutter/material.dart';

import '../filter_view.dart';

enum ColorEnums {
  red(Colors.red),
  green(Colors.green),
  yellow(Colors.yellow);

  final Color uniqueColors;
  const ColorEnums(this.uniqueColors);

  static List<ColorModels> get models {
    return ColorEnums.values.map((e) => ColorModels(e)).toList();
  }
}

class ColorModels extends IFilter {
  final ColorEnums color;

  ColorModels(this.color);

  @override
  int get id => color.index;

  @override
  String get key => color.name;
}
