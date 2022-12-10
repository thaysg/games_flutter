import 'package:flutter/material.dart';
import 'package:games_flutter/presenter/jokenpo/jokenpo_page.dart';

//import 'package:games_flutter/presenter/jokenpo/jokenpo_page.dart';

import '../tic_tac_toe/tic_tac_toe_page.dart';

class HomeController {
  void ticTacToe(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TicTacToePage(),
      ),
    );
  }

  void jokenpo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JokenpoPage(),
      ),
    );
  }
}
