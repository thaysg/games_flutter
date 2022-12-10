import 'package:flutter/material.dart';
import 'package:games_flutter/presenter/tic_tac_toe/game_tiles.dart';
import 'package:games_flutter/shared/primary_text.dart';

import '../../core/app_colors.dart';
import '../../shared/button_back.dart';
import '../../shared/button_widget.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({Key? key}) : super(key: key);

  @override
  TicTacToePageState createState() => TicTacToePageState();
}

class TicTacToePageState extends State<TicTacToePage> {
  String jogadorX = 'X';
  String jogadorO = '0';

  late String jogadorAtual = jogadorX;
  late bool fimJogo;
  late List<String> preenchido;

  void iniciarJogo() {
    jogadorAtual = jogadorX;
    fimJogo = false;
    preenchido = ['', '', '', '', '', '', '', '', ''];
  }

  @override
  void initState() {
    iniciarJogo();
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deseja Jogar Novamente?'),
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: const Text('Não'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Sim'),
                onPressed: () {
                  setState(() {
                    iniciarJogo();
                    Navigator.of(context).pop();
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  mensagemFimJogo(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Fim de Jogo \n $message",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  verificarEmpate() {
    if (fimJogo) {
      return;
    }
    bool empate = true;
    for (var occupiedPlayer in preenchido) {
      if (occupiedPlayer.isEmpty) {
        empate = false;
      }
    }

    if (empate) {
      mensagemFimJogo("Empate");
      fimJogo = true;
    }
  }

  verificarGanhador() {
    List<List<int>> combinacoesParaVencer = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var posicaoVencedora in combinacoesParaVencer) {
      String jPosicao0 = preenchido[posicaoVencedora[0]];
      String jPosicao1 = preenchido[posicaoVencedora[1]];
      String jPosicao2 = preenchido[posicaoVencedora[2]];

      if (jPosicao0.isNotEmpty) {
        if (jPosicao0 == jPosicao1 && jPosicao0 == jPosicao2) {
          mensagemFimJogo("Jogador $jPosicao0 Venceu");
          fimJogo = true;
          return;
        }
      }
    }
  }

  vezJogada() {
    if (jogadorAtual == jogadorX) {
      jogadorAtual = jogadorO;
    } else {
      jogadorAtual = jogadorX;
    }
  }

  void tapParaJogar(int index) {
    if (fimJogo || preenchido[index].isNotEmpty) {
      return;
    }
    setState(() {
      preenchido[index] = jogadorAtual;
      vezJogada();
      verificarGanhador();
      verificarEmpate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ButtonBack(),
        title: const Text('Jogo da Velha'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryText('Vez do Jogador ($jogadorAtual)'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 50,
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, int index) {
                        return GameTiles(
                          onTap: () {
                            tapParaJogar(index);
                          },
                          title: preenchido[index],
                          color:
                              preenchido[index] == jogadorX ? redDark : purple,
                        );
                      },
                    ),
                  ),
                ),
                ButtonWidget(
                  onPressed: () {
                    _showMyDialog();
                  },
                  title: 'Jogar Novamente',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


 /*  child: GridView.count(
                      crossAxisCount: boardlength ~/ 3,
                      padding: const EdgeInsets.all(16.0),
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      children: List.generate(
                        boardlength,
                        (index) {
                          return const GameTiles();
                        },
                      ),
                    ), */
