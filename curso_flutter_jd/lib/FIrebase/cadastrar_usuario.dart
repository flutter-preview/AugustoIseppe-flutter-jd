import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import

void main() async {


  FirebaseAuth auth = FirebaseAuth.instance;
  //Criando usuário com email e senha
  String email = "augusto.balan@hotmail.com";
  String senha = "123456";

  auth
      .createUserWithEmailAndPassword(
        email: email, 
        password: senha
        ).then((UserCredential userCredential) {
    print("Usuario cadastrado com sucesso: " +  userCredential.user!.email!);
  }).catchError((error) {
    print('"Novo usuario: erro: ' + error.toString());
  });


  runApp(MaterialApp(
    home: CadastroDeUsuario(),
  ));
}

class CadastroDeUsuario extends StatefulWidget {
  const CadastroDeUsuario({super.key});

  @override
  State<CadastroDeUsuario> createState() => _CadastroDeUsuarioState();
}

class _CadastroDeUsuarioState extends State<CadastroDeUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuarios com Firebase'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: [Text('Hello World')],
        ),
      ),
    );
  }
}
