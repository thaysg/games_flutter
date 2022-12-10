import 'dart:math';

import 'package:flutter/material.dart';

import 'play_jokenpo_page.dart';

class JokenPo {
  static int score = 0;

  static List<String> choices = ['Rock', 'Paper', 'Scissor'];

  static navTo(BuildContext context, Choice escolha) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayJokenpoPage(escolha),
      ),
    );
  }

  static String? randomChoice() {
    Random random = Random();
    int phoneChoiceIndex = random.nextInt(3);
    return choices[phoneChoiceIndex];
  }
}

class Choice {
  String type;
  Choice(this.type);

  static Map<String, Map<String, String>> rules = {
    'Rock': {
      'Rock': 'Empate! \n🙃',
      'Paper': 'Você perdeu! \n😭',
      'Scissor': 'Você ganhou! \n😄'
    },
    'Paper': {
      'Rock': 'Você ganhou! \n😄',
      'Paper': 'Empate! \n🙃',
      'Scissor': 'Você perdeu! \n😭'
    },
    'Scissor': {
      'Paper': 'Você perdeu! \n😭',
      'Rock': 'Você ganhou! \n😄',
      'Scissor': 'Empate! \n🙃'
    }
  };
}
