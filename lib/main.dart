// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './telaInicial.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FiscalizaRecife());
}

class FiscalizaRecife extends StatelessWidget {
  const FiscalizaRecife({Key key}) : super(key: key);

  static const String _title = 'Fiscaliza Recife';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: TelaPrincipal(),
        theme: ThemeData(
          primaryColor: Colors.lightBlue[900],
          accentColor: Colors.orange[400],
        ));
  }
}
