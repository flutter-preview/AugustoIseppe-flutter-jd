// ignore_for_file: camel_case_types

import 'dart:math';
import 'package:flutter/material.dart';

class App_Frases_do_Dia extends StatefulWidget {
  const App_Frases_do_Dia({super.key});

  @override
  State<App_Frases_do_Dia> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<App_Frases_do_Dia> {
  /* LÓGICA PARA GERAR A FRASE ALEATÓRIA */
  List<String> frasesUniverso = [
    "No universo, há tantos mundos fascinantes para explorar.",
    "O cosmos é vasto e cheio de mistérios.",
    "A imensidão do universo é de tirar o fôlego.",
    "O universo revela a grandeza da criação.",
    "Olhar para as estrelas nos faz refletir sobre nosso lugar no universo.",
    "O cosmos guarda segredos que ainda estamos descobrindo.",
    "O universo é um palco para eventos cósmicos espetaculares.",
    "A vastidão do espaço nos mostra quão pequenos somos.",
    "As galáxias são como ilhas no vasto oceano do universo.",
    "O universo é um livro aberto esperando para ser lido.",
    "O cosmos nos inspira a sonhar grande.",
    "Cada estrela no céu tem sua própria história.",
    "A escuridão do espaço nos leva a buscar a luz.",
    "Explorar o universo é uma busca pela verdade.",
    "O universo nos convida a desvendar seus segredos.",
    "A beleza do cosmos está além das palavras.",
    "O universo é um espetáculo em constante evolução.",
    "A curiosidade nos leva a desbravar o universo.",
    "No espaço infinito, nossa imaginação é livre para voar.",
    "O cosmos nos mostra a diversidade do universo.",
    "O universo é um tesouro de maravilhas para descobrir."
  ];
  /* INICIAR COM UMA FRASE ALEATÓRIA */
  var fraseGerada = " Clique no botão abaixo para gerar uma frase ";

  void _gerarFrase() {
    /* GERAR UM NUMERO RANDOMICO */
    var numeroSorteado = Random().nextInt(frasesUniverso.length);
    setState(() {
    fraseGerada = frasesUniverso[numeroSorteado];
    });
      
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frases do Dia'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Container(          
          width: double.infinity, //ocupa toda a largura da tela
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
              border: Border.all(width: 5, color: Colors.black)),
          child: Column(            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/logo.png'),
              Text(
                fraseGerada,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
              ElevatedButton(                
                onPressed: _gerarFrase,
                child: const Text('Nova Frase',
                style: TextStyle(                  
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold
                ),
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
