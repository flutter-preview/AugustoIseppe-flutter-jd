import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MeusDados extends StatefulWidget {
  const MeusDados({super.key});

  @override
  State<MeusDados> createState() => _MeusDadosState();
}

// FirebaseFirestore db = FirebaseFirestore.instance;
// DocumentSnapshot snapshot = await db.collection("usuarios").doc("002").get();
// // print("Nome: " + snapshot.get("nome").toString() +  "- Idade: " + snapshot.get("idade").toString());
// String? nome = snapshot.get("nome").toString();

class _MeusDadosState extends State<MeusDados> {
  String nome = " ";
  String sobrenome = " ";
  String idade = " ";
  String email = " ";

  @override
  void initState() {
    super.initState();
    buscarDados();
  }

  void buscarDados() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot =
        await db.collection("usuarios").doc("b1PfRL4o1QXgidOnnOwT").get();
    setState(() {
      nome = snapshot.get("nome").toString();
      sobrenome = snapshot.get("sobrenome").toString();
      idade = snapshot.get("idade").toString();
      email = snapshot.get("email").toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Nome",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            nome,
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
          Padding(padding: EdgeInsets.all(15)),
          Text(
            'Sobrenome: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            sobrenome,
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
          Padding(padding: EdgeInsets.all(15)),
          Text(
            'Idade: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            idade,
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
          Padding(padding: EdgeInsets.all(15)),
          Text(
            'Email: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            email,
            style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
