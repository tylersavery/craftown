import 'package:flutter/material.dart';

class PixelArtImageAsset extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const PixelArtImageAsset(
    this.imageUrl, {
    super.key,
    this.width = 16,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      width: width.toDouble(),
      height: height.toDouble(),
      fit: BoxFit.contain,
      isAntiAlias: false,
      filterQuality: FilterQuality.none,
    );
  }
}
