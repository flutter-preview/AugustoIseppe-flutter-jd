import 'package:flutter/material.dart';
import 'teste_cadastro.dart';
import 'meus_dados.dart';

class HomeTabBar extends StatefulWidget {

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Usuarios'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: 'Cadastro',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Meu cadastro',
              icon: Icon(Icons.data_object),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CadastrarUsuarios(),
          MeusDados(),          
        ]),
    );
  }
}
