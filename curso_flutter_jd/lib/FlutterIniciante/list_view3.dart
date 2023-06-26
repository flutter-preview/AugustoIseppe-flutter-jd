import 'package:flutter/material.dart';

class CriandoListView extends StatefulWidget {
  const CriandoListView({super.key});

  @override
  State<CriandoListView> createState() => _Criando_List_ViewState();
}

class _Criando_List_ViewState extends State<CriandoListView> {
  List _serieA = [
    "Atlético Mineiro",
    "Athletico Paranaense",
    "Bahia",
    "Bragantino",
    "Ceará",
    "Chapecoense",
    "Corinthians",
    "Cuiabá",
    "Flamengo",
    "Fluminense",
    "Fortaleza",
    "Grêmio",
    "Internacional",
    "Juventude",
    "Palmeiras",
    "Santos",
    "São Paulo",
    "Sport",
    "Vasco da Gama",
    "América Mineiro",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campeoato Brasileiro - Série A'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded( //LEMBRAR DE QUANDO FOR CRIAR UMA LISTVIEW, ENVOLVER O LISTVIEW DENTRO DE UMA EXPANDED
              child: ListView.builder(
                  itemCount: _serieA.length,
                  itemBuilder: (context, index) {
                    final itens = _serieA[index];
                    //o Dismissible serve para arrastar um time para a esquerda ou para direita...
                    return Dismissible(
                        background: Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget> [
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                              )
                            ],
                          ),
                          color: Colors.green,
                        ),
                        secondaryBackground: Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              )
                            ],
                          ),
                          color: Colors.red,
                        ),
                        direction: DismissDirection.horizontal,
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            print('Direção: endToStart');
                          } else if (direction == DismissDirection.startToEnd) {
                            print('Direção: startToEnd');
                          }
                          setState(() {
                            _serieA.removeAt(index);
                          });
                          // print('Direção ' + direction.toString());
                        },
                        key: Key(itens),
                        child: ListTile(
                          title: Text(itens),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
