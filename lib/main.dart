import 'package:flutter/material.dart';
import './drawer.dart';
import './secionarAno.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Fiscaliza Recife';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
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
        title: const Text('Fiscaliza Recife'),
        backgroundColor: Colors.lightBlue[900],
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text('Despesas'),
            ),
            Tab(
              child: Text('Receitas'),
            ),
          ],
        ),
      ),
      drawer: Menu(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Column(
              children: [
                SelecionarAno(),
                Text('Gráficos Despesas'),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                SelecionarAno(),
                Text('Gráficos Receitas'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
