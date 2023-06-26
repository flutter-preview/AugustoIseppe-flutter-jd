import 'package:flutter/material.dart';
class Atm_Clientes extends StatefulWidget {
  const Atm_Clientes({super.key});

  @override
  State<Atm_Clientes> createState() => _ServicosState();
}

class _ServicosState extends State<Atm_Clientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}