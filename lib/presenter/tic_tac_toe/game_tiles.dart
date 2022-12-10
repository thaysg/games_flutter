import 'package:flutter/material.dart';
import 'package:games_flutter/shared/primary_text.dart';

import '../../core/app_colors.dart';

class GameTiles extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Color color;
  const GameTiles({
    Key? key,
    this.onTap,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 30,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: orangeDark,
          //borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: PrimaryText(
              title,
              color: color,
              size: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
