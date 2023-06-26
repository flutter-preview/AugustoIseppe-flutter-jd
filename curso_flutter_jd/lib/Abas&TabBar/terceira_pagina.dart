import 'package:flutter/material.dart';

class TerceiraPagina extends StatefulWidget {
  const TerceiraPagina({super.key});

  @override
  State<TerceiraPagina> createState() => _PrimeiraPaginaState();
}

class _PrimeiraPaginaState extends State<TerceiraPagina> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Terceira Página teste'),
          ],
        ),
      ),
    );
  }
}
