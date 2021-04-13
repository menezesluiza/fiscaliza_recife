import 'package:flutter/material.dart';
import './telaInicial.dart';

void main() => runApp(const FiscalizaRecife());

class FiscalizaRecife extends StatelessWidget {
  const FiscalizaRecife({Key? key}) : super(key: key);

  static const String _title = 'Fiscaliza Recife';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: TelaPrincipal(),
        theme: ThemeData(
          primaryColor: Colors.lightBlue[900],
          accentColor: Colors.orange[400],
          //fontFamily: 'Schyler',
        ));
  }
}
