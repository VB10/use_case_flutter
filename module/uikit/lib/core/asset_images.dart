import 'package:flutter/material.dart';

enum AssetImages {
  notFound('img_not_found');

  final String name;
  const AssetImages(this.name);

  Widget get toPngImage {
    return Image.asset(
      'asset/$name.png',
      package: 'uikit',
    );
  }
}
