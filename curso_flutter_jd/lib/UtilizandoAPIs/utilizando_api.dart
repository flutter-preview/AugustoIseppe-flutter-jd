// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Consumo_Servicos_API extends StatefulWidget {
  const Consumo_Servicos_API({super.key});

  @override
  State<Consumo_Servicos_API> createState() => _Consuno_Servicos_APIState();
}

class _Consuno_Servicos_APIState extends State<Consumo_Servicos_API> {
  final TextEditingController _escolhaCep = TextEditingController();
  String endereco = '';
  /* MÉTODO PARA RECUPERAR O CEP */
  Future<void> _recuperarCep() async {
    String cepInformado = _escolhaCep.text;
    String url = 'https://viacep.com.br/ws/$cepInformado/json/';
    http.Response response; //variavel chamada response do tipo response
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno['logradouro'];
    String bairro = retorno['bairro'];
    String localidade = retorno['localidade'];
    json.decode(response.body);
    // print('Resposta: ' + response.statusCode.toString());
    print(response.body);
    setState(() {
      endereco = '$logradouro, $bairro, $localidade-SP';
    });
    // print('Endereço: ${logradouro}, ${bairro}, ${localidade}-SP ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utilizando API'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(
                width: 230,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white38,
                    labelText: 'Informe o CEP: (Apenas numeros)',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.center,
                  maxLength: 10,
                  controller: _escolhaCep,
                  // onSubmitted: (String _escolhaCep) {
                  //   print('cep' + _escolhaCep);
                  // },
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              FilledButton(
                  onPressed: _recuperarCep, child: const Text('Obter Endereço')),
                  const Padding(padding: EdgeInsets.all(20)),
              Text(
                endereco,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
