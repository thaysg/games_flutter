import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../shared/primary_text.dart';

class ScoreWidget extends StatelessWidget {
  final String score;
  const ScoreWidget({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: lilyWhite,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PrimaryText('SCORE'),
            PrimaryText(score),
          ],
        ),
      ),
    );
  }
}
