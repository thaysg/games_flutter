import 'package:flutter/material.dart';

import 'core/app_colors.dart';
import 'presenter/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //Muda a cor de fundo de todas as telas
        scaffoldBackgroundColor: primaryDark,

        //Tema da AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryDark,
          elevation: 0,
          centerTitle: true,
        ),

        //Tema do Botão
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: purple,
            elevation: 5,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
