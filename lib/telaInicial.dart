import 'dart:ui';
import 'package:flutter/material.dart';
import './drawer.dart';
import './secionarAno.dart';
import './grid.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/FR_horizontal.png'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text('Despesas', style: TextStyle(fontSize: 18)),
            ),
            Tab(
              child: Text('Receitas', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      drawer: Menu(),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SelecionarAno(),
                  Container(
                    child: GridGraficos(),
                    height: 3000,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SelecionarAno(),
                  Container(
                    child: GridGraficos(),
                    height: 3000,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
