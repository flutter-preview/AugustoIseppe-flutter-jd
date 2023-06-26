/* revisado */
import 'package:flutter/material.dart';
/* revisado */
// ignore: camel_case_types, must_be_immutable
class Tela_Secundaria extends StatefulWidget {

  /* ISSO É NECESSARIO PARA PASSAR DADOS DE UMA TELA PARA OUTRA */
  String? nome;
  Tela_Secundaria({super.key, this.nome});

  @override
  State<Tela_Secundaria> createState() => _Tela_SecundariaState();
}

class _Tela_SecundariaState extends State<Tela_Secundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.nome}'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red[100],
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                /* ISSO É NECESSÁRIO PARA PASSAR DADOS DE UMA TELA PARA OUTRA */
                'Perfil de ${widget.nome}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              // FilledButton(                  onPressed: () {}, child: Text('Ir para página inicial')),
            ],
          ),
        ),
      ),
    );
  }
}
