import 'package:flutter/material.dart';

class GridRec extends StatelessWidget {
  const GridRec({
    Key? key,
    required this.dropdownValueR,
  }) : super(key: key);

  final String dropdownValueR;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        children: <Widget>[
          Card(
            elevation: 10,
            //margin: EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text('Gráfico receitas do ano $dropdownValueR'),
              //child: Image.asset('images/FR_quadrado.png'),
              color: Colors.orange[100],
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text('Gráfico receitas do ano $dropdownValueR'),
              color: Colors.orange[200],
            ),
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
      ),
      height: 3000,
      width: double.maxFinite,
      alignment: Alignment.center,
    );
  }
}
