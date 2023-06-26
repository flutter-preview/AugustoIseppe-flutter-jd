import 'package:desenvolvimento_flutter/Abas&TabBar/primeira_pagina.dart';
import 'package:desenvolvimento_flutter/Abas&TabBar/segunda_pagina.dart';
import 'package:desenvolvimento_flutter/Abas&TabBar/terceira_pagina.dart';
import 'package:flutter/material.dart';

class AbasETabBar extends StatefulWidget {
  const AbasETabBar({super.key});

  @override
  State<AbasETabBar> createState() => _AbasETabBarState();
}

class _AbasETabBarState extends State<AbasETabBar> with SingleTickerProviderStateMixin {

  TabController? _tabController; //necessário para usar o TabBar
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abas e TabBar'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget> [
            Tab(
              text: 'Home',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Email',
              icon: Icon(Icons.email),
            ),
            Tab(
              text: 'Home',
              icon: Icon(Icons.account_circle),
            ),
          ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
        PrimeiraPagina(),
        SegundaPagina(),
        TerceiraPagina()
      ]),
      
    );
  }
}