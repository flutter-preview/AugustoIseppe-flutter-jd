/* REVISADO */
import 'package:flutter/material.dart';
/* REVISADO */

class Switch_and_Slider extends StatefulWidget {
  const Switch_and_Slider({super.key});

  @override
  State<Switch_and_Slider> createState() => _Switch_and_SliderState();
}

class _Switch_and_SliderState extends State<Switch_and_Slider> {
  /* UTILIZANDO SWITCH */
  bool _receberNotificacoes = true;

  /* UTILIZANDO SWITCHLISTTILE */
  bool _receberOfertas = false;
  bool _receberDescontos = false;
  bool _receberPromocoes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch and Slider'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              const Text(
                'Switch',
                style: TextStyle(
                  fontSize: 30,
                  decoration: TextDecoration.underline,
                ),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              const Text('Deseja receber notificações? S/N'),
              Switch(
                  value: _receberNotificacoes,
                  onChanged: (bool escolhaUsuario) {
                    setState(() {
                      _receberNotificacoes = escolhaUsuario;
                      print('Deseja receber as notificações? $escolhaUsuario');
                    });
                  }),
                  Padding(padding: EdgeInsets.all(20)),
                  Text('Deseja receber o troco em dinheiro'),
                Switch(
                  value: _receberNotificacoes, 
                  onChanged: (bool escolhaUsuario){
                    setState(() {
                    _receberNotificacoes = escolhaUsuario;
                    });
                      
                  }),
              const Divider(
                height: 20, //espaçamento
                thickness: 3, // altura da linha
                indent: 20, //identação inicio
                endIndent: 20, //identação final
                color: Colors.blue, //cor da linha
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              const Text(
                'SwitchListTile',
                style: TextStyle(
                  fontSize: 30,
                  decoration: TextDecoration.underline,
                ),
              ),
              // bool _receberOfertas = false;
              // bool _receberDescontos = false;
              // bool _receberPromocoes = false;
              SwitchListTile(
                  title: const Text('Receber Ofertas? '),
                  value: _receberOfertas,
                  onChanged: (bool escolhaOfertas) {
                    setState(() {
                      _receberOfertas = escolhaOfertas;
                      // print('Receber ofertas? ' + escolhaOfertas.toString());
                    });
                  }),
              SwitchListTile(
                  title: const Text('Receber Descontos?'),
                  value: _receberDescontos,
                  onChanged: (bool escolhaDescontos) {
                    setState(() {
                      _receberDescontos = escolhaDescontos;
                      // print('Receber descontos? ' + escolhaDescontos.toString());
                    });
                  }),
              SwitchListTile(
                  title: const Text('Receber Promocoes?'),
                  value: _receberPromocoes,
                  onChanged: (bool escolhaPromocoes) {
                    setState(() {
                      _receberPromocoes = escolhaPromocoes;
                      // print('Receber Promocoes? ' + escolhaPromocoes.toString());
                    });
                  }),
                FilledButton(                                  
                  onPressed: () {
                    print('Receber Ofertas? $_receberOfertas');
                    print('Receber Descontos? $_receberDescontos');
                    print('Receber Promocoes? $_receberPromocoes');
                  }, 
                  child: const Text('Salvar'))
            ],
          ),
        ),
      ),
    );
  }
}
