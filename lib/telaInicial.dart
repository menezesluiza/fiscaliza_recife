import 'dart:ui';
import 'package:flutter/material.dart';
import './drawer.dart';
//import './secionarAno.dart';
import './gridDesp.dart';
// ignore: import_of_legacy_library_into_null_safe
import './gridRec.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[];

  @override
  Widget build(BuildContext context) {
    _widgetOptions.add(GridDesp(dropdownValueD: '2021'));
    _widgetOptions.add(GridRec());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Image.asset('images/FR_horizontal.png'),
        centerTitle: true,
        //bottom:
      ),
      drawer: Menu(),
      body: Column(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            label: 'Despesas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward_outlined),
            label: 'Receitas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
