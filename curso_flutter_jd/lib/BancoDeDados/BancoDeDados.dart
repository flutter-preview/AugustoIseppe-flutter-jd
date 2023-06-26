import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  _recuperarBandoDeDados() async {
    //MÉTODO PARA CRIAR O BANCO DE DADOS
    final caminhoBandoDados = await getDatabasesPath();
    final localBandoDados = join(caminhoBandoDados, "banco.db");
    var bd = await openDatabase(
      localBandoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente) {
        String sql =
            'CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)';
        db.execute(sql);
      },
    );
    return bd;
    // print('Aberto: ' + bd.isOpen.toString());
    // print('Caminho Banco de Dados: ' + caminhoBandoDados.toString());
  }

  //SALVAR DADOS EM UM BANCO DE DADOS
  _salvar() async {
    Database bd = await _recuperarBandoDeDados();
    Map<String, dynamic> dadosUsuario = {'nome': 'Olá', 'idade': 6};
    int id = await bd.insert('usuarios', dadosUsuario);
    print('Id: $id');
  }

  _listarUsuarios() async {
    Database bd = await _recuperarBandoDeDados();
    String sql = 'SELECT * FROM usuarios';
    // String sql = 'SELECT * FROM usuarios WHERE idade = 32';
    // String sql = 'SELECT nome FROM usuarios';
    List usuarios = await bd.rawQuery(sql);
    for (var usuario in usuarios) {
      print(' Id:' +
          usuario['id'].toString() +
          ' - nome:' +
          usuario['nome'] +
          ' - idade:' +
          usuario['idade'].toString());
    }
    print('Usuarios: ' + usuarios.toString());
  }

  _listarUsuarioPeloId(int id) async {
    Database bd = await _recuperarBandoDeDados();
    //CRUD -> create, read, update and delete
    List usuarios = await bd.query('usuarios',
        columns: ['id', 'nome', 'idade'], where: 'id = ?', whereArgs: [id]);
    for (var usuario in usuarios) {
      print('item Id:' +
          usuario['id'].toString() +
          ' - nome:' +
          usuario['nome'] +
          ' - idade:' +
          usuario['idade'].toString());
    }
  }

  _excluirUsuario(int id) async {
    Database bd = await _recuperarBandoDeDados();
    int retorno = await bd.delete(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id]
    );
    print('Item qtde removida: $retorno');
  }

  @override
  Widget build(BuildContext context) {
    // _recuperarBandoDeDados();
    // _salvar();
    _listarUsuarios();
    // _listarUsuarioPeloId(8);
    // _excluirUsuario(9);
    return Container();
  }
}
