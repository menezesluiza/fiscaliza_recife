import 'package:flutter/material.dart';
import './sobre.dart';

class Menu extends StatelessWidget {
  Menu();

  void _aboutScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return TelaSobre();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55, //largura
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 200,
              child: DrawerHeader(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Fiscaliza Recife',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Tela Inicial'),
              hoverColor: Colors.lightBlue[100],
              onTap: () => Navigator.pop(context),
              leading: const Icon(Icons.home),
              horizontalTitleGap: 0,
              // subtitle: Text(
              // 'Saiba mais sobre dados abertos',
              // style: TextStyle(color: Colors.grey[800]),
              //),
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () => _aboutScreen(context),
              leading: const Icon(Icons.info_outline_rounded),
              horizontalTitleGap: 0,
              //subtitle: Text(
              //'Saiba mais sobre esse aplicativo',
              //style: TextStyle(color: Colors.grey[800]),
            ),
            const ListTile(
              title: const Text('Sair'),
              leading: const Icon(Icons.exit_to_app),
              onTap: null,
              horizontalTitleGap: 0,
            ),
          ],
        ),
      ),
    );
  }
}
