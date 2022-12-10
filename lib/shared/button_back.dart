import 'package:flutter/material.dart';
import 'package:games_flutter/core/app_colors.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.chevron_left_rounded,
        color: lilyWhite,
        size: 32,
      ),
    );
  }
}
