import 'package:flutter/material.dart';
import './detalhesGrafico.dart';

class GridRec extends StatelessWidget {
  const GridRec({
    Key? key,
    required this.dropdownValueR,
  }) : super(key: key);

  final String dropdownValueR;

  void _chartScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return DetalhesGrafico(dropdownValueR);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            InkWell(
              onTap: () => _chartScreen(context),
              splashColor: Colors.pink,
              focusColor: Colors.pink,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Text('Gráfico receitas  $dropdownValueR'),
                color: Colors.orange[100],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Text('Gráfico receitas do ano $dropdownValueR'),
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
        ));
  }
}
