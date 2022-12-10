import 'package:flutter/material.dart';
import 'package:games_flutter/core/app_assets.dart';
import 'package:games_flutter/core/app_colors.dart';
import 'package:games_flutter/presenter/jokenpo/game_controller.dart';
import 'package:games_flutter/presenter/jokenpo/jokenpo_page.dart';
import 'package:games_flutter/presenter/jokenpo/widgets/game_button.dart';
import 'package:games_flutter/shared/primary_text.dart';

import '../../shared/button_widget.dart';
import 'widgets/score_widget.dart';

class PlayJokenpoPage extends StatefulWidget {
  final Choice choice;
  const PlayJokenpoPage(this.choice, {Key? key}) : super(key: key);

  @override
  State<PlayJokenpoPage> createState() => _PlayJokenpoPageState();
}

class _PlayJokenpoPageState extends State<PlayJokenpoPage> {
  @override
  Widget build(BuildContext context) {
    //PlayerChoice
    String? playerChoice;
    switch (widget.choice.type) {
      case 'Rock':
        playerChoice = rock;
        break;
      case 'Paper':
        playerChoice = paper;
        break;
      case 'Scissor':
        playerChoice = scissor;
        break;
      default:
    }

//PlayerChoiceColor
    Color? playerChoiceColor;
    switch (widget.choice.type) {
      case 'Rock':
        playerChoiceColor = secondaryDark;
        break;
      case 'Paper':
        playerChoiceColor = redLight;
        break;
      case 'Scissor':
        playerChoiceColor = orangeDark;
        break;
      default:
    }

    //PhoneChoice
    String? phoneChoice = JokenPo.randomChoice();
    String? phoneChoicePath = '';
    switch (phoneChoice) {
      case 'Rock':
        phoneChoicePath = rock;
        break;
      case 'Paper':
        phoneChoicePath = paper;
        break;
      case 'Scissor':
        phoneChoicePath = scissor;
        break;
      default:
    }

    if (Choice.rules[widget.choice.type]![phoneChoice] == 'Você ganhou! \n😄') {
      setState(() {
        JokenPo.score++;
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ScoreWidget(score: '${JokenPo.score}'),
              Row(
                children: [
                  Expanded(
                    child: Hero(
                      tag: widget.choice.type,
                      child: GameButton(
                        image: playerChoice ?? rock,
                        color: playerChoiceColor ?? secondaryDark,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const PrimaryText(
                    'VS',
                    size: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GameButton(
                      image: phoneChoicePath,
                      color: primaryLight,
                    ),
                  ),
                ],
              ),
              PrimaryText(
                '${Choice.rules[widget.choice.type]![phoneChoice]}',
                size: 50,
                fontWeight: FontWeight.bold,
              ),
              ButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JokenpoPage(),
                    ),
                  );
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
