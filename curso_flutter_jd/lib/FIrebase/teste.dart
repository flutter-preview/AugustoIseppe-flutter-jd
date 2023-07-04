import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'dart:ui';


void main() async {

  //! INICIALIZAR O FIREBASE - método para utilizar qqr recurso do firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;


  FirebaseFirestore.instance
  .collection("usuarios")
  .doc("pontuacao")
  .set({"Augusto" : "250", "Ana":"590"});

  //! SALVANDO A ATUALIZANDO
  // db.collection("usuarios")
  // .doc("003")
  // .set({
  //   "nome" : "Augusto",
  //   "idade" : "30"
  // });

  //!ADICIONAR DADOS NO BANCO DE DADOS GERANDO UM IDENTIFICADOR UNICO
  // DocumentReference ref = await db.collection("noticias")
  // .add({
  //   "titulo" : "Criada moeda virtual",
  //   "descricao" : "teste exemplo"
  // });
  // print("Dados: " + ref.id);

  //! REMOVENDO E RECUPERANDO DADOS
  // db.collection("usuarios").doc("001").delete();

  // DocumentSnapshot snapshot = await db.collection("usuarios")
  // .doc("003")
  // .get();
  // var dados = snapshot.data();
  // print("Dados: " + dados["nomes"]);

  //! RECUPERAR DOCUMENTOS PARA UMA COLLETCION
  // QuerySnapshot querySnapshot = await db
  // .collection("Usuarios")
  // .get();
  // print("Dados: " + querySnapshot.docs.toString());

  // for ( DocumentSnapshot item in querySnapshot.docs ) {
  //   var dados = item.data();
  //   print("Dados: " + dados["nome"] + " - " + dados["idade"]);
  // }

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Firebase'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: [
            Text('Hello World')
          ],
        ),
      ),
    );
  }
}

