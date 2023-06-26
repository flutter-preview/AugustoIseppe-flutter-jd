import 'package:flutter/material.dart';

class App_Alcool_Gasolina extends StatefulWidget {
  const App_Alcool_Gasolina({super.key});

  @override
  State<App_Alcool_Gasolina> createState() => _App_Alcool_GasolinaState();
}

class _App_Alcool_GasolinaState extends State<App_Alcool_Gasolina> {
  final TextEditingController _valorAlcool = TextEditingController();
  final TextEditingController _valorGasolina = TextEditingController();
  String _resultado = '';

  void _calcular() {
    double precoAlcool =
        double.tryParse(_valorAlcool.text.replaceAll(",", "."))!;
    double precoGasolina =
        double.tryParse(_valorGasolina.text.replaceAll(",", "."))!;

    // ignore: unnecessary_null_comparison
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado =
            "Numero Invalido, digite numeros maiores que 0 e utilizando (.)";
      });
    } else {
      setState(() {
        // _resultado = "Numero válido, faço o cálculo";
        if ((precoAlcool / precoGasolina) >= 0.7) {
          setState(() {
            _resultado = "Abasteça com GASOLINA";
          });
        } else {
          setState(() {
            _resultado = 'Abasteça com ALCOOL';
          });
        }
      });
      _limparCampos();
    }
  }

      void _limparCampos () {
      _valorAlcool.text = '';
      _valorGasolina.text = '';
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Alcool ou Gasolina?'),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Container(
              //   decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment(0.8, 1),
              //     colors: <Color>[
              //       Color.fromARGB(255, 213, 229, 250),
              //       Color.fromARGB(255, 206, 201, 255),
        
              //     ], // Gradient from https://learnui.design/tools/gradient-generator.html
              //     tileMode: TileMode.mirror,
              //   ),
              // ),
              /* ##### IMAGEM LOGO ##### */
              padding: const EdgeInsets.all(30),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 60)),
            Image.asset('images/alcool_gasolina.png'),
            const Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                'Qual a melhor opção de abastecimento para seu veículo? Alcool ou Gasolina?',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 127, 226),
                ),
                textAlign: TextAlign.center,
              ),
            ),
        
            /* ##### INPUT ALCOOL ##### */
            SizedBox(
              width: 250,
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'Preço do Alcool: ',
                    labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                keyboardType: TextInputType.number,
                maxLength: 20,
                controller: _valorAlcool,
                onSubmitted: (String valorAlcool) {
                  print('Valor do Alcool: $valorAlcool');
                },
              ),
            ),
        
            /* ##### INPUT GASOLINA ##### */
            SizedBox(
              width: 250,
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'Preço da Gasolina: ',
                    labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                keyboardType: TextInputType.number,
                maxLength: 20,
                controller: _valorGasolina,
                onSubmitted: (String valorGasolina) {
                  print('Valor da Gasolina: $valorGasolina');
                },
              ),
            ),
            /* ##### BOTÃO CALCULAR ##### */
            const Padding(padding: EdgeInsets.all(20)),
            FilledButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.indigo),
                minimumSize: MaterialStateProperty.all<Size>(
                    const Size(200, 48)), //ajuste da largura do botao
              ),
              onPressed: _calcular,
              child: const Text(
                'Calcular',
                style: TextStyle(fontSize: 15, letterSpacing: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _resultado,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
              ),
            ),
        ));
  }
}
