import 'package:flutter/material.dart';
class Atm_Servicos extends StatefulWidget {
  const Atm_Servicos({super.key});

  @override
  State<Atm_Servicos> createState() => _ServicossState();
}

class _ServicossState extends State<Atm_Servicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicos'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}