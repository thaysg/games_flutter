import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final double height;
  final TextAlign? textAlign;

  const PrimaryText(
    this.text, {
    Key? key,
    this.fontWeight = FontWeight.w500,
    this.color = lilyWhite,
    this.size = 25,
    this.height = 1.3,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        height: height,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
