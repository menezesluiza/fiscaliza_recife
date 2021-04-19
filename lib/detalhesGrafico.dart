import 'package:flutter/material.dart';

class DetalhesGrafico extends StatelessWidget {
  @override
  final String ano;

  const DetalhesGrafico(this.ano);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/FR_horizontal.png'),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Text('Detalhes Gráfico $ano'),
      ),
    );
  }
}
