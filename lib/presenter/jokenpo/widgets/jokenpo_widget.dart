import 'package:flutter/material.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_colors.dart';
import '../game_controller.dart';
import 'game_button.dart';

class JokenpoWidget extends StatelessWidget {
  const JokenpoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'Rock',
          child: GameButton(
            onTap: () {
              JokenPo.navTo(
                context,
                Choice('Rock'),
              );
            },
            image: rock,
            color: secondaryDark,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: 'Paper',
              child: GameButton(
                onTap: () {
                  JokenPo.navTo(
                    context,
                    Choice('Paper'),
                  );
                },
                image: paper,
                color: redLight,
              ),
            ),
            Hero(
              tag: 'Scissor',
              child: GameButton(
                onTap: () {
                  JokenPo.navTo(
                    context,
                    Choice('Scissor'),
                  );
                },
                image: scissor,
                color: orangeDark,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
