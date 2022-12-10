import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/app_assets.dart';
import '../../shared/button_widget.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(splash),
            ButtonWidget(
              width: 300,
              onPressed: () {
                controller.ticTacToe(context);
              },
              title: 'Jogo da Velha',
            ),
            const SizedBox(height: 30),
            ButtonWidget(
              width: 300,
              onPressed: () {
                controller.jokenpo(context);
              },
              title: 'JokenPo',
            ),
          ],
        ),
      ),
    );
  }
}
