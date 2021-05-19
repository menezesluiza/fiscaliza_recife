import 'dart:ui';
import 'package:flutter/material.dart';
import './drawer.dart';
import './gridDesp.dart';
// ignore: import_of_legacy_library_into_null_safe
import './gridRec.dart';

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

  final _selectedItemColor = Colors.white;
  final _unselectedItemColor = Colors.white70;
  final Color _selectedBgColor = Colors.lightBlue[900] as Color;
  final Color _unselectedBgColor = Colors.lightBlue[700] as Color;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[];

  Color _getBgColor(int index) =>
      _selectedIndex == index ? _selectedBgColor : _unselectedBgColor;

  Color _getItemColor(int index) =>
      _selectedIndex == index ? _selectedItemColor : _unselectedItemColor;

  Widget _buildIcon(IconData iconData, String text, int index) => Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Material(
          color: _getBgColor(index),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  size: 25,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 14,
                      color: _getItemColor(index),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onTap: () => _onItemTapped(index),
          ),
        ),
      );

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
        selectedFontSize: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        //backgroundColor: Colors.white,
        selectedItemColor: _selectedItemColor,
        unselectedItemColor: _unselectedItemColor,
        elevation: 8.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            //icon: Icon(Icons.arrow_downward_outlined),
            icon: _buildIcon(Icons.insert_chart_rounded, 'DESPESAS', 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                _buildIcon(Icons.insert_chart_outlined_rounded, 'RECEITAS', 1),
            //icon: Icon(Icons.arrow_upward_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
