import 'package:flutter/material.dart';
import 'package:games_flutter/shared/button_widget.dart';

import 'game_controller.dart';
import 'widgets/jokenpo_widget.dart';
import 'widgets/score_widget.dart';

class JokenpoPage extends StatelessWidget {
  JokenpoPage({Key? key}) : super(key: key);

  final JokenPo controller = JokenPo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ScoreWidget(score: '${JokenPo.score}'),
              const SizedBox(height: 20),
              const JokenpoWidget(),
              const SizedBox(height: 20),
              ButtonWidget(
                onPressed: () {
                  Navigator.pop(context);
                },
                title: 'VOLTAR',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
