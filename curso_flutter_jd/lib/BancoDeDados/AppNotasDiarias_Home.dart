// ignore_for_file: unused_import, unused_field, unused_local_variable, duplicate_ignore

import 'package:curso_flutter_jd/helper/AnotacaoHelper.dart';
import 'package:curso_flutter_jd/model/anotacao.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart'; //biblioteca para poder utilizar a formatação de data
import 'package:intl/date_symbol_data_local.dart'; //biblioteca para poder utilizar a formatação de data

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  var _db = AnotacaoHelper();
  List<Anotacao?> _anotacoes = [];

  //MÉTODO PARA ABRIR O ALERTDIALOG
  _exibirTelaCadastro({Anotacao? anotacao}) {
    String textoSalvarAtualizar = "";
    if (anotacao == null) {
      //salvando
      _tituloController.text = " ";
      _descricaoController.text = " ";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _tituloController.text = anotacao.titulo!;
      _descricaoController.text = anotacao.descricao!;
      textoSalvarAtualizar = "Atualizar";
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" $textoSalvarAtualizar anotação "),
            content: Column(
              //define o tamanho do item que vc está utilizando
              mainAxisSize: MainAxisSize
                  .min, //MainAxisSize.min -> define o tamanho necessario
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Título', hintText: 'Digite um título'),
                  maxLength: 20,
                  controller: _tituloController,
                  autofocus: true,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Descrição', hintText: 'Digite a descrição'),
                  maxLength: 20,
                  controller: _descricaoController,
                ),
              ],
            ),
            actions: <Widget>[
              FilledButton(
                  onPressed: () => Navigator.pop(
                      context), //FUNÇAO PARA FECHAR A ALERT QUANDO PRESSIONAR O CANCELAR
                  child: Text('Cancelar')),
              Padding(padding: EdgeInsets.all(10)),
              FilledButton(
                  onPressed: () {
                    _salvarAtualizarAnotacao(anotacaoSelecionada: anotacao);
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar)),
            ],
          );
        });
  }

  _recuperarAnotacoes() async {
    List anotacoesRecuperadas = await _db.recuperarAnotacoes();
    List<Anotacao>? listaTemporaria = [];
    for (var item in anotacoesRecuperadas) {
      Anotacao anotacao = Anotacao.fromMap(item);
      listaTemporaria.add(anotacao);
    }
    setState(() {
      _anotacoes = listaTemporaria!;
    });
    listaTemporaria = null;

    print("Lista Anotacoes: " + anotacoesRecuperadas.toString());
  }

  //MÉTODO PARA SALVAR UMA ANOTAÇÃO
  _salvarAtualizarAnotacao({Anotacao? anotacaoSelecionada}) async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    if (anotacaoSelecionada == null) {
      //salvando
      Anotacao anotacao =
          Anotacao(titulo, descricao, DateTime.now().toString());
      // ignore: unused_local_variable
      int resultado = await _db.salvarAnotacao(anotacao);
    } else {
      //atualizando
      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      anotacaoSelecionada.data = DateTime.now().toString();
      int resultado = await _db.atualizarAnotacao(anotacaoSelecionada);
    }

    // print('Salvar anotacao: ' + resultado.toString());
    _tituloController.clear(); //-> limpar o TextField após salvar
    _descricaoController.clear(); //-> limpar o TextField após salvar
    _recuperarAnotacoes();
  }


  //MÉTODO PARA FORMATAR UMA DATA
  _formatarData(String data) {
    initializeDateFormatting('pt_BR');
    var formatador = DateFormat.yMMMd("pt-BR");
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);
    return dataFormatada;
  }

  _removerAnotacao(int id) async {
    await _db.removerAnotacao(id);
    _recuperarAnotacoes();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recuperarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    _recuperarAnotacoes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Notas Diárias'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _anotacoes.length,
                  itemBuilder: (context, index) {
                    final anotacao = _anotacoes[index];
                    return Card(
                      child: ListTile(
                        title: Text(anotacao!.titulo.toString()),
                        subtitle: Text(
                            "${_formatarData(anotacao.data.toString())} - ${anotacao.descricao.toString()}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(anotacao: anotacao);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(Icons.edit, color: Colors.green),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerAnotacao(anotacao.id!);
                              },
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro(); //esse método será chamado ao pressionar o botao floatingActiopnButton -> o método está acima
          }),
    );
  }
}
