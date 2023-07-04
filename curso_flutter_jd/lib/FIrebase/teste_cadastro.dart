import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastrarUsuarios extends StatefulWidget {
  const CadastrarUsuarios({super.key});

  @override
  State<CadastrarUsuarios> createState() => _CadastrarUsuariosState();
}

//!controller -> recupera os dados digitados no textfield
TextEditingController controllerNome = TextEditingController();
TextEditingController controllerSobrenome = TextEditingController();
TextEditingController controllerIdade = TextEditingController();
TextEditingController controllerEmail = TextEditingController();

//!método para salvar os dados no banco de dados
void cadastrarUsuario() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  // ignore: unused_local_variable
  DocumentReference ref = await db.collection("usuarios").add({
    //usando o add o identificado é gerado automaticamente
    "nome": controllerNome.text,
    "sobrenome": controllerSobrenome.text,
    "idade": controllerIdade.text,
    "email": controllerEmail.text,
  });
  limparCampos();
}

//!método para limpar os campos após enviar os dados para o banco de dados
void limparCampos() {
  controllerEmail.text = ' ';
  controllerIdade.text = ' ';
  controllerNome.text = ' ';
  controllerSobrenome.text = ' ';
}

//!método para filtrar dados de um banco de dados
void filtrarDados() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  QuerySnapshot querySnapshot = await db.collection('usuarios')
  .where("nome", isEqualTo: 30)
  .where("idade", isEqualTo: 30)
  //.where("idade", isGreaterThan: 30)
  //.where("idade", isGreaterThanOrEqualTo: 30)
  //.where("idade", isLessThan: 30)
  //.where("idade", isLessThanOrEqualTo: 30)
  //.where("idade", isNotEqualTo: 30)
  .orderBy("idade", descending: true)
  .limit(2) //pega apenas os dois primeiros registros do banco de dados
  .get();

  for (DocumentSnapshot item in querySnapshot.docs) {
    var dados = item.data();
    // print(" Filtro nome: ${dados["nome"]} idade: $dados["idade"]}" );
  }
}

//! método para fazer uma pesquisa de texto
void pesquisarTexto () async { 
  FirebaseFirestore db = FirebaseFirestore.instance;
  QuerySnapshot querySnapshot = await db.collection("usuarios")
  .where("nome", isGreaterThanOrEqualTo: "m")
  .where("nome", isLessThanOrEqualTo: "m" + "\uf8ff")
  .get();
    for (DocumentSnapshot item in querySnapshot.docs) {
    var dados = item.data();
    // print(" Filtro nome: ${dados["nome"]} idade: $dados["idade"]}" );
  }
}

class _CadastrarUsuariosState extends State<CadastrarUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar novo Usuário'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 28, 223, 34),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(12)),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: controllerNome,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Nome',
                        filled: true,
                        fillColor: Colors.grey[300]),
                    // maxLength: 50,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(padding: EdgeInsets.all(12)),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: controllerSobrenome,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Sobrenome',
                        filled: true,
                        fillColor: Colors.grey[300]),
                    // maxLength: 50,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(padding: EdgeInsets.all(12)),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: controllerIdade,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Idade',
                        filled: true,
                        fillColor: Colors.grey[300]),
                    // maxLength: 50,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(padding: EdgeInsets.all(12)),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: controllerEmail,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.grey[300]),
                    // maxLength: 50,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(padding: EdgeInsets.all(12)),
                FilledButton(
                    onPressed: cadastrarUsuario, child: Text('Cadastrar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
