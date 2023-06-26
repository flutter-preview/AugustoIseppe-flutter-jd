// ignore_for_file: unused_local_variable, avoid_print, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// ignore: unused_import
import 'dart:async';

class Consumo_Servicos_API2 extends StatefulWidget {
  const Consumo_Servicos_API2({super.key});

  @override
  State<Consumo_Servicos_API2> createState() => _Consumo_Servicos_API2State();
}

class _Consumo_Servicos_API2State extends State<Consumo_Servicos_API2> {

  String _preco = '0';
  void _recuperarPreco () async {
    String url = 'https://blockchain.info/ticker';
    http.Response response;
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    print('Resultado: ' + retorno['BRL']['buy'].toString());
    setState(() {
      _preco = retorno['BRL']['buy'].toString();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utilizando API - pt2'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.all(30)),
              Text('R\$ ' + _preco,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),),
              const Padding(padding: EdgeInsets.all(20)),
              FilledButton(
                onPressed: _recuperarPreco, 
                child: const Text('Atualizar')),
            ],
          ),
        ),
      ),
    );
  }
}