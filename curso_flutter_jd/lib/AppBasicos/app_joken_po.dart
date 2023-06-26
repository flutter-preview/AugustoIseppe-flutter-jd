import 'dart:math';
import 'package:flutter/material.dart';
// import 'dart:math';

class App_Joken_Po extends StatefulWidget {
  const App_Joken_Po({super.key});

  @override
  State<App_Joken_Po> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<App_Joken_Po> {
  var _imagemApp = const AssetImage('images/padrao.png');
  var _mensagem = "Escolha uma opção abaixo";
  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print('Escolha do App: $escolhaApp');
    print('Escolha do Usuario: $escolhaUsuario');

    //escolha da imagem escolhida pelo app
    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          _imagemApp = const AssetImage('images/pedra.png');
        });
        break;

      case 'papel':
        setState(() {
          _imagemApp = const AssetImage('images/papel.png');
        });
        break;

      case 'tesoura':
        setState(() {
          _imagemApp = const AssetImage('images/tesoura.png');
        });
        break;
    }

    //VALIDAÇÃO DO GANHADOR
    //USUARIO GANHADOR
    if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')) {
      setState(() {
        _mensagem = 'PARABÉNS, VOCÊ GANHOU!!';
      });
    }
    //COMPUTADOR GANHADOR
    else if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra')) {
      setState(() {
        _mensagem = 'QUE PENA, VOCÊ PERDEU!!';
      });
    } else {
      setState(() {
        _mensagem = 'EMPATE';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joken Po'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Escolha do App: ',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image(
            image: _imagemApp,
            height: 110,
          ),
          Text(
            _mensagem,
            style: const TextStyle(
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset(
                  'images/pedra.png',
                  height: 115,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset(
                  'images/papel.png',
                  height: 115,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset(
                  'images/tesoura.png',
                  height: 115,
                ),
              ),
            ],
          ),
          const Text('Selecione uma das imagens e clique nela para jogar'),
        ],
      ),
    );
  }
}
