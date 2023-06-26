import 'package:flutter/material.dart';

class PrimeiraPagina extends StatefulWidget {
  const PrimeiraPagina({super.key});

  @override
  State<PrimeiraPagina> createState() => _PrimeiraPaginaState();
}

class _PrimeiraPaginaState extends State<PrimeiraPagina> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      child: GridView.count(      
        crossAxisCount: 2,
        children: [
          Image.asset('images/cao.png'),
          Image.asset('images/gato.png'),
          Image.asset('images/leao.png'),
          Image.asset('images/macaco.png'),
          Image.asset('images/ovelha.png'),
          Image.asset('images/vaca.png'),
        ],),
    );

  }
}