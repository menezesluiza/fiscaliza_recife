import 'package:flutter/material.dart';

class DetalhesGrafico extends StatelessWidget {
  final String _ano;

  const DetalhesGrafico(this._ano);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/FR_horizontal.png'),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Text('Detalhes Gráfico $_ano'),
      ),
    );
  }
}
/*
void _chartScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) {
      return DetalhesGrafico(widget.dropdownValueR);
    }),
  );
}*/
