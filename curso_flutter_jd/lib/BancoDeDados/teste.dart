import 'package:flutter/material.dart';

class teste extends StatefulWidget {
  const teste({super.key});

  @override
  State<teste> createState() => _testeState();
}

class _testeState extends State<teste> {
  TextEditingController _capturarTitulo = TextEditingController();
  TextEditingController _capturarDescricao = TextEditingController();
  _exibirTelaCadastro() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Anotação'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: _capturarTitulo,
                decoration: InputDecoration(
                    labelText: 'Título', hintText: 'Adicione um titulo'),
                maxLength: 20,
                autofocus: true,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _capturarDescricao,
                decoration: InputDecoration(
                    labelText: 'Descricao', hintText: 'Adicione uma descricao'),
                maxLength: 20,
                autofocus: true,
              ),
            ],            
          ),
          actions: <Widget> [
            FilledButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
            Padding(padding: EdgeInsets.all(10)),
            FilledButton(onPressed: () {              
              Navigator.pop(context);
            }, child: Text('Salvar'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anotações Diárias'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: _exibirTelaCadastro),
    );
  }
}
