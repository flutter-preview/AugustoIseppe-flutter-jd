import 'package:flutter/material.dart';
/* REVISADO *//* REVISADO */
class Utilizando_List_View extends StatefulWidget {
  const Utilizando_List_View({super.key});


  @override
  State<Utilizando_List_View> createState() => _Utilizando_List_ViewState();
}

class _Utilizando_List_ViewState extends State<Utilizando_List_View> {
  final List _itens = [];

  void _carregarItens() {
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = {};
      item['titulo'] = 'Titulo $i Lorem ipsum';
      item['descricao'] = 'Descricao $i Lorem ipsum';
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {
              //Map<String, dynamic> item = _itens[indice];
              //print("item ${ _itens[indice]['titulo']}" );
              return ListTile(
                onTap: () {
                  print('evento de clique ativado -> $indice');
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(_itens[indice]['titulo']),
                          titlePadding: const EdgeInsets.all(30),
                          titleTextStyle: const TextStyle(
                            fontSize: 15,
                          ),
                          content: Text(_itens[indice]['descricao']),
                          // contentPadding: EdgeInsets.all(30),
                          contentTextStyle: const TextStyle(
                            fontSize: 15,
                          ),
                          backgroundColor: Colors.redAccent,
                          actions: [
                            FilledButton(
                                onPressed: () {
                                  print('Enviar');
                                  Navigator.pop(
                                      context); // comando para fechar a alert ao enviar
                                },
                                child: const Text('Sim')),
                            FilledButton(
                                onPressed: () {
                                  print('Conteudo não enviado');
                                  Navigator.pop(
                                      context); // comando para fechar a alert ao enviar
                                },
                                child: const Text('Nao enviar')),
                          ],
                        );
                      });
                },
                title: Text(_itens[indice]['titulo']),
                subtitle: Text(_itens[indice]['descricao']),
              );
            }),
      ),
    );
  }
}
