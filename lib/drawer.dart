import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  Menu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Opções',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ListTile(
            //leading: Icon(Icons.message),
            title: Text('Dados Abertos'),
          ),
          ListTile(
            //leading: Icon(Icons.account_circle),
            title: Text('Sobre'),
          ),
          ListTile(
            //leading: Icon(Icons.settings),
            title: Text('Sair'),
          ),
        ],
      ),
    );
  }
}
