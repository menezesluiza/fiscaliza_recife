import 'package:flutter/material.dart';

class GridGraficos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          //child: const Text('Grafico1'),
          child: Image.asset('images/FR_quadrado.png'),
          color: Colors.orange[100],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Grafico2'),
          color: Colors.orange[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Grafico3'),
          color: Colors.orange[300],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Grafico4'),
          color: Colors.orange[400],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Grafico 5 '),
          color: Colors.orange[500],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Grafico 6'),
          color: Colors.orange[600],
        ),
      ],
    );
  }
}
