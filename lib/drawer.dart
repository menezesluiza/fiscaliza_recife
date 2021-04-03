import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  Menu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue[900],
            ),
            child: Text(
              'Opções:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            //leading: Icon(Icons.message),
            title: Text('?'),
          ),
          ListTile(
            //leading: Icon(Icons.account_circle),
            title: Text('Dados Abertos'),
          ),
          ListTile(
            //leading: Icon(Icons.settings),
            title: Text('Sobre'),
          ),
        ],
      ),
    );
  }
}
