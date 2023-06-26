import 'package:flutter/material.dart';
import 'app_atm_consultoria_empresa.dart';
import 'app_atm_consultoria_servicos.dart';
import 'app_atm_consultoria_clientes.dart';
import 'app_atm_consultoria_contato.dart';

class Atm_Consultoria_Inicio extends StatefulWidget {
  const Atm_Consultoria_Inicio({super.key});

  @override
  State<Atm_Consultoria_Inicio> createState() => _Atm_Consultoria_InicioState();
}

class _Atm_Consultoria_InicioState extends State<Atm_Consultoria_Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM Consultoria'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/logo_atm.png'),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const A_Empresa()));
                    },
                    child: Image.asset('images/menu_empresa.png'),
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Atm_Servicos()));
                    },
                    child: Image.asset('images/menu_servico.png'),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Atm_Clientes()));
                    },
                    child: Image.asset('images/menu_cliente.png'),
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Atm_Contato()));
                    },
                    child: Image.asset('images/menu_contato.png'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
