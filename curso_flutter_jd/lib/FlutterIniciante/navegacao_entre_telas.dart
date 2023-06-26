/* revisado */
import 'package:desenvolvimento_flutter/FlutterIniciante/navegacao_entre_telas2.dart';
import 'package:flutter/material.dart';
/* revisado */
class Tela_Principal extends StatefulWidget {
  const Tela_Principal({super.key});

  @override
  State<Tela_Principal> createState() => _Navegacao_entre_TelasState();
}

class _Navegacao_entre_TelasState extends State<Tela_Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navegação entre Telas"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Augusto Iseppe Balan',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              FilledButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Tela_Secundaria(nome: 'Augusto Iseppe Balan')));},
                child: const Text('Visitar Perfil - Rota Normal')),
              // FilledButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/secundaria');
              //     },
              //     child: Text('Visitar Perfil - Rota Nomeada')),
            ],
          ),
        ),
      ),
    );
  }
}
