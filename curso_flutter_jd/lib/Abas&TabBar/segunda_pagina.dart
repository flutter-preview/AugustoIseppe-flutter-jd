import 'package:flutter/material.dart';

class SegundaPagina extends StatefulWidget {
  const SegundaPagina({super.key});

  @override
  State<SegundaPagina> createState() => _PrimeiraPaginaState();
}

class _PrimeiraPaginaState extends State<SegundaPagina> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Segunda Página teste'),
          ],
        ),
      ),
    );
  }
}
