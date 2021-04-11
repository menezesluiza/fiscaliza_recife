import 'dart:ui';
import 'package:flutter/material.dart';
import './drawer.dart';
import './secionarAno.dart';
import './grid.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Fiscaliza Recife';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: MyStatefulWidget(),
        theme: ThemeData(
          primaryColor: Colors.lightBlue[900],
          accentColor: Colors.orange[400],
          fontFamily: 'Schyler',
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
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
                  //Text('Gráficos Despesas'),
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
                  // Text('Gráficos Receitas'),
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
