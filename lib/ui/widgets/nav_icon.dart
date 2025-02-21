import 'package:flutter/material.dart';

sealed class NavAsset {}

class NavIcon extends NavAsset {
  final IconData iconData;
  final double? size;
  final Color? color;

  NavIcon(this.iconData, {this.size, this.color});
}

class NavImage extends NavAsset {
  final String assetPath;
  final double? width;
  final double? height;

  NavImage(this.assetPath, {this.width, this.height});
}

class CustomNavIcon extends StatelessWidget {
  final NavAsset asset;

  const CustomNavIcon({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a pattern `switch` (Dart 3) to handle each subtype:
    return switch (asset) {
      NavIcon(iconData: var i, size: var s, color: var c) =>
        Icon(i, size: s, color: c),
      NavImage(assetPath: var p, width: var w, height: var h) =>
        Image.asset(p, width: w, height: h),
    };
  }
}
