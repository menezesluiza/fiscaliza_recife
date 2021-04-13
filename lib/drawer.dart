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
                'Opções:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Fiscaliza Recife'),
            onTap: null,
            subtitle: Text(
              'Saiba mais sobre esse aplicativo',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          ListTile(
            title: Text('Dados Abertos'),
            hoverColor: Colors.lightBlue[100],
            onTap: null,
            subtitle: Text(
              'Saiba mais sobre dados abertos',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          ListTile(
            title: Text('Sair'),
            leading: Icon(Icons.exit_to_app),
            onTap: null,
            horizontalTitleGap: 0,
          ),
        ],
      ),
    );
  }
}
