// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartRecCategoria extends StatefulWidget {
  const ChartRecCategoria({
    Key key,
    this.recCorrente,
    this.recCapital,
    this.recCorrenteInfra,
  }) : super(key: key);

  final double recCorrente;
  final double recCapital;
  final double recCorrenteInfra;

  @override
  _ChartRecCategoriaState createState() => _ChartRecCategoriaState();
}

class _ChartRecCategoriaState extends State<ChartRecCategoria> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartRecCategoriaData, String>> _seriesData = [];

    var _data = [
      new ChartRecCategoriaData(
          'CORRENTE', widget.recCorrente / 1000000, Colors.lightBlue[300]),
      new ChartRecCategoriaData(
          'CAPITAL', widget.recCapital / 1000000, Colors.lightBlue[500]),
      new ChartRecCategoriaData('CORRENTES INTRAORÇAMENTÁRIAS',
          widget.recCorrenteInfra / 1000000, Colors.lightBlue[800]),
    ];

    _seriesData.add(
      charts.Series(
          domainFn: (ChartRecCategoriaData rec, _) => rec.tipo,
          measureFn: (ChartRecCategoriaData rec, _) => rec.valor,
          id: 'Receitas',
          data: _data,
          colorFn: (ChartRecCategoriaData rec, _) =>
              charts.ColorUtil.fromDartColor(rec.colorval),
          labelAccessorFn: (ChartRecCategoriaData rec, _) =>
              '${rec.valor.toStringAsFixed(3)}'),
    );

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text('Receita Arrecadada por Categoria'),
          Expanded(
            child: charts.PieChart(
              _seriesData,
              animate: true,
              animationDuration: Duration(seconds: 2),
              behaviors: [
                new charts.DatumLegend(
                    outsideJustification:
                        charts.OutsideJustification.endDrawArea,
                    horizontalFirst: false,
                    desiredMaxRows: 2,
                    cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                    entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.blue.shadeDefault,
                        fontSize: 11))
              ],
              defaultRenderer: new charts.ArcRendererConfig(
                  arcWidth: 200,
                  arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.auto),
                  ]),
            ),
          )
        ],
      ),
      color: Colors.orange[100],
    );
  }
}

class ChartRecCategoriaData {
  String tipo;
  double valor;
  Color colorval;

  ChartRecCategoriaData(this.tipo, this.valor, this.colorval);
}
