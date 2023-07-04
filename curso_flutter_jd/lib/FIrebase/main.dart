// ignore_for_file: unused_local_variable
// ignore: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // //!método para inicializar o FIREBASE ---
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;
  //Criando usuário com email e senha
  String email = "darinha@hotmail.com";
  String senha = "123456";

  // auth
  //     .createUserWithEmailAndPassword(
  //       email: email,
  //       password: senha
  //       ).then((UserCredential userCredential) {
  //   print("Usuario cadastrado com sucesso: " +  userCredential.user!.email!);
  // }).catchError((error) {
  //   print('"Novo usuario: erro: ' + error.toString());
  // });

  // UserCredential? usuarioAtual = auth.currentUser as UserCredential?;

  // if (usuarioAtual != null) {
  //   // Usuário logado
  //   print('Usuário atual logado: ' + usuarioAtual.user!.email!);
  // } else {
  //   print('Usuário atual está deslogado.');
  // }

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
