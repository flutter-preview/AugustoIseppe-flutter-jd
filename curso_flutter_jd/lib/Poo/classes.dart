void main() {
  /* OBJETO = PESSOA1 */
  Pessoa pessoa1 = Pessoa(nome: 'Augusto', idade: 31);
  print('Nome: ${pessoa1.nome} - Idade: ${pessoa1.idade}');

  /* OBJETO = PESSOA2 */
  Pessoa pessoa2 = Pessoa(nome: 'Darinha', idade: 7);
  print('Nome: ${pessoa2.nome} - Idade: ${pessoa2.idade}');
}

/* CLASSE PARA CRIAR UM OBJETO */
class Pessoa {
  
  /* CONSTRUTOR */
  Pessoa({required String this.nome, required int this.idade}); 

  /* ATRIBUTOS */
  String? nome;
  int? idade;
  bool? casado;

  /* MÉTODO SÃO FUNÇÕES DENTRO DE UMA CLASSE */
  void aniversario() {
    print('Parabéns! $nome');
    if (idade != null) {
      idade = idade! + 1;
    }
  }

  void casar() {
    casado = true;
  }
}
