import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utilizando_Preferencias1 extends StatefulWidget {
  const Utilizando_Preferencias1({super.key});

  @override
  State<Utilizando_Preferencias1> createState() =>
      _Utiliznado_Preferencias1State();
}

class _Utiliznado_Preferencias1State extends State<Utilizando_Preferencias1> {
  TextEditingController _controllerCampo = TextEditingController();
  String _textoSalvo = ' + Nada Salvo + ';

  /* MÉTODO E LÓGICA PARA SALVAR DADOS NO CELULAR */
  _salvar() async {
    String valorDigitado = _controllerCampo.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', valorDigitado);
    print('Operacao (Salvar):  $valorDigitado');
  }

  /* MÉTODO E LÓGICA PARA RECUPERAR OS DADOS SALVOS NO CELULAR */
  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _textoSalvo = prefs.getString('nome') ?? "Sem valor";
    });
    print('Operacao (Recuperar):  $_textoSalvo');
  }

  /* MÉTODO E LÓGICA PARA DELETAR OS DADOS SALVOS NO CELULAR */
  _remover() async {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('nome');
        print('Operaco (Remover)');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Utilizando Preferências'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_textoSalvo),

            /* ##### INPUT TEXT ##### */
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Digite algo',
                  labelStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              maxLength: 100,
              controller: _controllerCampo,
            ),
            Padding(padding: EdgeInsets.all(10)),

            /* ##### BOTOES SALVAR E RECUPERAR */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: _salvar,
                  child: Text('Salvar'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 28, 197, 34))),
                ),
                Padding(padding: EdgeInsets.all(5)),
                FilledButton(onPressed: _recuperar, child: Text('Recuperar')),
                Padding(padding: EdgeInsets.all(5)),
                FilledButton(
                  onPressed: _remover,
                  child: Text('Remover'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
