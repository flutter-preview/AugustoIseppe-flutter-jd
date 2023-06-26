import 'package:curso_flutter_jd/model/anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/* ########################################################################################## */
/* TODO ESTE ARQUIVO É RESPONSÁVEL POR CRIAR A CONEXAO COM O BANCO DE DADOS */
/* ########################################################################################## */

//UTILIZANDO O PADRAO SINGLETON -> RECOMENDADO QUANDO SE UTILIZA PARA MANIPULAR BANCO DE DADOS
class AnotacaoHelper {
  static final String nomeTabela = 'anotacao';
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database? _db;
  factory AnotacaoHelper() {
    return _anotacaoHelper;
  }
  AnotacaoHelper._internal() {}

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }

  _onCreate(Database db, int version) async {
    /**
     id titulo descricao data
     01 teste  testeDes  02/10/2020     
    */
    String sql = "CREATE TABLE anotacao ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, " 
      "titulo VARCHAR, "
      "descricao TEXT, "
      "data DATERIME)"; 
    await db.execute(sql);
  }

  inicializarDB() async {
    //MÉTODO RESPONSÁVEL POR INICIALIZAR O BANCO DE DADOS
    final caminhoBancoDados = await getDatabasesPath(); // recupera o caminho do banco de dados
    final localBancoDados = join(caminhoBancoDados,'banco_minhas_anotacoes.db'); // o segundo parametro é um nome de sua escolha
    var db = await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<int> salvarAnotacao(Anotacao anotacao) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, anotacao.toMap());
    return resultado;
  }

  recuperarAnotacoes() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY data ASC";
    List anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  Future<int> atualizarAnotacao(Anotacao anotacao) async {
    var bancoDados = await db;
    return await bancoDados.update(
      nomeTabela,
      anotacao.toMap(),
      where: "id = ?",
      whereArgs: [anotacao.id]
    );
  }

  Future<int> removerAnotacao (int id) async {
    var bancoDados = await db;
    return await bancoDados.delete(
      nomeTabela,
      where: "ID = ?",
      whereArgs: [id]
    );

  }
}


