import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class AppListaTarefas extends StatefulWidget {
  const AppListaTarefas({super.key});

  @override
  State<AppListaTarefas> createState() => _AppListaTarefasState();
}

class _AppListaTarefasState extends State<AppListaTarefas> {
  /* antes de criar a listView, deve-se criar uma Lista */

  List _listaTarefas = [];
  Map<String, dynamic> _ultimaTarefaRemovida = Map();
  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {
    //CÓDIGO PARA BUSCAR O CAMINHO ONDE SERÁ SALVO OS ARQUIVOS NO APARELHO CELULAR
    final diretorio = await getApplicationDocumentsDirectory();
    return File('${diretorio.path}/dados.json');
  }

  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;
    //-----
    Map<String, dynamic> tarefa = Map();
    tarefa['Título'] = textoDigitado;
    tarefa['realizada'] = false;
    //-----
    setState(() {
      _listaTarefas.add(tarefa);
    });
    _salvarArquivo();
    _controllerTarefa.text = '';
  }

  /* MÉTODO PARA SALVAR ARQUIVOS */
  _salvarArquivo() async {
    var arquivo = await _getFile();
    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  Widget criarItemLista(context, index) {
    // final item = _listaTarefas[index]['Título'];    
    return Dismissible(
      // o datetime.now(.millis.... serve para gerar uma chave dentro do map sem que ela se repita... 
      // pois dentro de um map nao pode ter chaves repetidas)
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        onDismissed: (direction) {
          //recuperar o último item excluído
          _ultimaTarefaRemovida = _listaTarefas[index];
          //Remover o item da lista
          _listaTarefas.removeAt(index);
          _salvarArquivo();

          //snackbar
          final snackbar = SnackBar(
            backgroundColor: Colors.green,
            action: SnackBarAction(
              label: 'Desfazer', 
              textColor: Colors.white,
              onPressed: (){
              //inserir novamente na lista
              setState(() {
              _listaTarefas.insert(index, _ultimaTarefaRemovida);
              });
              _salvarArquivo();
                
              }),
            duration: Duration(seconds: 5),
            content: Text('Tarefa Removida!!'),
            
          );

          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ],
          ),
        ),
        child: CheckboxListTile(
          title: Text(_listaTarefas[index]['Título']),
          value: _listaTarefas[index]['realizada'],
          onChanged: (valorAlterado) {
            setState(() {
              _listaTarefas[index]['realizada'] = valorAlterado;
            });
            _salvarArquivo();
            // print('Valor: ' + valorAlterado.toString());
          },
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = jsonDecode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // _salvarArquivo();
    // print('Itens: ' + DateTime.now().millisecondsSinceEpoch.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //1º -> antes de tudo, deve-se criar uma lista
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: criarItemLista,
            ),
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          // floatingActionButton: FloatingActionButton(
        ],
      ),
      /* @#@#@#@# FLOATING ACTION BUTTON @#@#@#@# */
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          //AO CLICAR NO FLOATING ACTION BUTTON, SERÁ EXIBINDO UM ALERT DIALOG
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Adicionar Tarefa'),
                  content: TextField(
                    keyboardType: TextInputType.text,
                    maxLength: 100,
                    controller: _controllerTarefa,
                    decoration: InputDecoration(
                      labelText: 'Digite sua tarefa',
                    ),
                    onChanged: (texto) {},
                  ),
                  actions: <Widget>[
                    FilledButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancelar')),
                    FilledButton(
                      child: Text('Salvar'),
                      onPressed: () {
                        //CONFIGURAR A AÇÃO DE SALVAR
                        _salvarTarefa();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
      ),
      // child: Icon(Icons.add),

      /* #$#$#$#$#$ RODAPÉ #$#$#$#$#$#$ */
      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  print('Item adicionado com sucesso');
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  print('Item removido com sucesso');
                },
                icon: Icon(Icons.delete_forever_rounded)),
            IconButton(
                onPressed: () {
                  print('Item atualizado com sucesso');
                },
                icon: Icon(Icons.system_update_alt)),
          ],
        ),
      ),
    );
  }
}
