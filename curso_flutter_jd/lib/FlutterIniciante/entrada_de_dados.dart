import 'package:flutter/material.dart';
/* revisado  */
/* revisado  */

class EntradaDeDados extends StatefulWidget {
  const EntradaDeDados({super.key});

  @override
  State<EntradaDeDados> createState() => _EntradaDeDadosState();
}

class _EntradaDeDadosState extends State<EntradaDeDados> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada de Dados'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          /* ##### NOME DE USUÁRIO ##### */
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              keyboardType: TextInputType.text,
              // keyboardType: TextInputType.number,
              // keyboardType: TextInputType.emailAddress,
              // keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(labelText: 'Usuário'),
              maxLength: 15,
              // maxLengthEnforcement: false,//limita a qtdade de caracteres especificada
              style: const TextStyle(fontSize: 20, color: Colors.black),
              onSubmitted: (String nomeUsuario) {
                print('Nome de Usuário: $nomeUsuario');
              },
              controller: _textEditingController,
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     print('Valor digitado: ' + _textEditingController.text);
          //   }, 
          //   child: Text('Salvar')),

          /* ##### SENHA DE USUÁRIO ##### */
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              keyboardType: TextInputType.text,
              // keyboardType: TextInputType.number,
              // keyboardType: TextInputType.emailAddress,
              // keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(labelText: 'Senha'),
              maxLength: 15,
              // maxLengthEnforcement: false,//limita a qtdade de caracteres especificada
              style: const TextStyle(fontSize: 20, color: Colors.black),
              obscureText: true,
              onSubmitted: (String senhaUsuario) {
                print('Senha do Usuário: $senhaUsuario');
              },
              controller: _textEditingController1,
            ),
          )
        ],
      ),
    );
  }
}
