import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Utilizando_API_Avancado extends StatefulWidget {
  const Utilizando_API_Avancado({super.key});

  @override
  State<Utilizando_API_Avancado> createState() =>
      _Utilizando_API_AvancadoState();
}

class _Utilizando_API_AvancadoState extends State<Utilizando_API_Avancado> {
  Future<Map> _recuperarPreco() async {
    String url = 'https://blockchain.info/ticker';
    http.Response response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <Map>(
      future: _recuperarPreco(),
      builder: (context, snapshot) {
        String resultado;
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          print('conexao');
          resultado = 'Carregando..';
          break;
          case ConnectionState.active:
          case ConnectionState.done:
          print('conexao done');
          if (snapshot.hasError) {
            resultado = 'Erro ao carregar os dados';
          } else {
            double valor = snapshot.data?['BRL']['buy'];
            resultado = "Preço do Bitcoin: ${valor.toString()}";
          }
          break;
        }
        return Center(
          child: Text(resultado),
          );
      },
    );
  }
}
