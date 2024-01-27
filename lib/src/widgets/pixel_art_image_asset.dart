import 'package:flutter/material.dart';

class PixelArtImageAsset extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final bool isSpriteSheet;

  const PixelArtImageAsset(
    this.imageUrl, {
    super.key,
    this.width = 16,
    this.height = 16,
    this.isSpriteSheet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      width: width.toDouble(),
      height: height.toDouble(),
      fit: isSpriteSheet ? BoxFit.fitHeight : BoxFit.contain,
      isAntiAlias: false,
      filterQuality: FilterQuality.none,
      alignment: isSpriteSheet ? Alignment.centerLeft : Alignment.center,
    );
  }
}
