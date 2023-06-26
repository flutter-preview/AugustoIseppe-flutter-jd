class Anotacao {
  int? id; // é gerado automaticamente
  String? titulo;
  String? descricao;
  String? data;

  //construtor
  Anotacao(this.titulo, this.descricao, this.data);

//nao entendi
  Anotacao.fromMap(Map map){
    this.id = map["id"];
    this.titulo = map["titulo"];
    this.descricao = map["descricao"];
    this.data = map["data"];
  }

  Map toMap() {
      Map<String, dynamic> map = {
      "titulo" : this.titulo,
      "descricao" : this.descricao,
      "data" : this.data,
    };

    if( this.id != null ) {
      map["id"] = this.id;
    }
    return map;
  }
}