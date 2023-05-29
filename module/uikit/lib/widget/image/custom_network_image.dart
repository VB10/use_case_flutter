import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uikit/core/asset_images.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({Key? key, required this.url}) : super(key: key);
  final String? url;

  String get _url => (url?.isEmpty ?? true) ? '' : url!;
  @override
  Widget build(BuildContext context) {
    return _url.isEmpty ? AssetImages.notFound.toPngImage : CachedNetworkImage(imageUrl: _url);
  }
}
