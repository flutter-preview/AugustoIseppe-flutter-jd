import 'package:flutter/material.dart';
class Atm_Contato extends StatefulWidget {
  const Atm_Contato({super.key});

  @override
  State<Atm_Contato> createState() => _Atm_ContatoState();
}

class _Atm_ContatoState extends State<Atm_Contato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}