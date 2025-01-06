import 'package:flutter/material.dart';

class ColorFilteredImage extends StatelessWidget {
  final String imageUrl;
  final Color color;

  ColorFilteredImage({required this.imageUrl, required this.color});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      child: Image.network(imageUrl),
    );
  }
}