import 'package:flutter/material.dart';
/* revisado  *//* revisado  */

class checkbox_and_radioButton extends StatefulWidget {
  const checkbox_and_radioButton({super.key});

  @override
  State<checkbox_and_radioButton> createState() => _CheckboxxX_State();
}

class _CheckboxxX_State extends State<checkbox_and_radioButton> {
  /* VARIAVEIS DO CHECKBOX */

  bool _estaSelecionado = false;
  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

  /* VARIAVEIS DO RADIOBUTTON */
  String _escolhaUsuario = '';

  /* VARIAVEIS DO RADIOLISTTILE */
  String _escolhaUsuario1 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utilizando Checkbox'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 30)),
                /* UTILIZANDO O CHECKBOX */
                /* UTILIZANDO O CHECKBOX */
                const Text(
                  'Checkbox: ',
                  style: TextStyle(fontSize: 30),
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                const Text('Comida Brasileira'),
      
                /* PRIMEIRO MÉTODO DE UTILIZAR O CHECKBOX */
                Checkbox(
                  value: _estaSelecionado,
                  onChanged: (bool? valor) {
                    setState(() {
                      _estaSelecionado = valor!;
                    });
                    print('Comida Brasileira Teste: $valor');
                  },
                ),
      
                /* SEGUNDO MÉTODO DE UTILIZAR O CHECKBOX */
                CheckboxListTile(
                    title: const Text('Comida Brasileira'),
                    subtitle: const Text('Arroz, Feijão, Bife, Batata Frita, Farofa'),
                    activeColor: Colors.red,
                    secondary: const Icon(Icons.add_location_sharp),
                    value: _comidaBrasileira,
                    onChanged: (bool? resultado) {
                      setState(() {
                        _comidaBrasileira = resultado!;
                      });
                      print('Comida Brasileira: $resultado');
                    }),
                CheckboxListTile(
                    title: const Text('Comida Mexicana'),
                    subtitle: const Text('Burrito, Nacho, Tortillas, Pozole'),
                    activeColor: Colors.deepPurple,
                    secondary: const Icon(Icons.ac_unit_rounded),
                    value: _comidaMexicana,
                    onChanged: (bool? resultado1) {
                      setState(() {
                        _comidaMexicana = resultado1!;
                      });
                      print('Comida Mexicana: $resultado1');
                    }),
                const Padding(padding: EdgeInsets.all(15)),
                FilledButton(
                    onPressed: () {
                      print('Comida Brasileira: $_comidaBrasileira / Comida Mexicana: $_comidaMexicana');
                    },
                    child: const Text('Selecionar')),
                const Divider(
                  height: 20, //espaçamento
                  thickness: 3, // altura da linha
                  indent: 20, //identação inicio
                  endIndent: 20, //identação final
                  color: Colors.blue, //cor da linha
                ),
      
                /* UTILIZANDO O RADIO BUTTON */
                /* UTILIZANDO O RADIO BUTTON */
                const Padding(padding: EdgeInsets.only(top: 30)),
                const Text(
                  'RadioButton: ',
                  style: TextStyle(fontSize: 30),
                ),
                const Text('Masculino'),
                Radio(
                    value: 'M',
                    groupValue: _escolhaUsuario,
                    onChanged: (String? escolha) {
                      setState(() {
                        _escolhaUsuario = escolha!;
                      });
                      print('Sexo: ${escolha!}');
                    }),
                const Text('Feminino'),
                Radio(
                    value: 'F',
                    groupValue: _escolhaUsuario,
                    onChanged: (String? escolha) {
                      setState(() {
                        _escolhaUsuario = escolha!;
                      });
                      print('Sexo: ${escolha!}');
                    }),
                const Divider(
                  height: 20, //espaçamento
                  thickness: 3, // altura da linha
                  indent: 20, //identação inicio
                  endIndent: 20, //identação final
                  color: Colors.blue, //cor da linha
                ),
      
                /* UTILIZANDO O RADIO BUTTON */
                /* UTILIZANDO O RADIO BUTTON */
                const Padding(padding: EdgeInsets.only(top: 30)),
                const Text(
                  'RadioListTile: ',
                  style: TextStyle(fontSize: 30),
                ),
                RadioListTile(
                    title: const Text('Masculino'),
                    value: 'M',
                    groupValue: _escolhaUsuario1,
                    onChanged: (String? escolha1) {
                      setState(() {
                        _escolhaUsuario1 = escolha1!;
                      });
                      print('Sexo: ${escolha1!}');
                    }),
                RadioListTile(
                    title: const Text('Feminino'),
                    value: 'F',
                    groupValue: _escolhaUsuario1,
                    onChanged: (String? escolha1) {
                      setState(() {
                        _escolhaUsuario1 = escolha1!;
                      });
                      print('Sexo: ${escolha1!}');
                    }),

                    /* RECUPERANDO DADOS ATRAVÉS DO FILLED BUTTON */
                    const Padding(padding: EdgeInsets.only(top: 30)),
                    FilledButton(
                      onPressed: () {
                        print('Resultado: $_escolhaUsuario');
                        print('Resultado1: $_escolhaUsuario1');
                      }, 
                      child: const Text('Salvar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
