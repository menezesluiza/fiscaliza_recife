// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartRecOrigem extends StatefulWidget {
  const ChartRecOrigem({
    Key key,
    this.transfCorr,
    this.impostos,
    this.outrasCred,
    this.opCredito,
    this.outrasCap,
    this.recPatri,
    this.recServ,
    this.transfCap,
    this.contri,
    this.alien,
    this.amort,
  }) : super(key: key);

  final double transfCorr;
  final double impostos;
  final double outrasCred;
  final double opCredito;
  final double outrasCap;
  final double recPatri;
  final double recServ;
  final double transfCap;
  final double contri;
  final double alien;
  final double amort;

  @override
  _ChartRecOrigemState createState() => _ChartRecOrigemState();
}

class _ChartRecOrigemState extends State<ChartRecOrigem> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartRecOrigemData, String>> _seriesData = [];

    var _data = [
      new ChartRecOrigemData(
          'TRANSF CORRENTES', widget.transfCorr / 1000000, Colors.blue[300]),
      new ChartRecOrigemData(
          'IMPOSTOS E TAXAS', widget.impostos / 1000000, Colors.blue[500]),
      new ChartRecOrigemData(
          'RECEITAS CORRENTES', widget.outrasCred / 1000000, Colors.blue[800]),
      new ChartRecOrigemData('OPERAÇÕES DE CRÉDITO', widget.opCredito / 1000000,
          Colors.green[300]),
      new ChartRecOrigemData(
          'RECEITAS DE CAPITAL', widget.outrasCap / 1000000, Colors.green[500]),
      new ChartRecOrigemData(
          'RECEITA PATRIMONIAL', widget.recPatri / 1000000, Colors.green[800]),
      new ChartRecOrigemData(
          'RECEITA DE SERVIÇOS', widget.recServ / 1000000, Colors.yellow[300]),
      new ChartRecOrigemData(
          'TRANSF DE CAPITAL', widget.transfCap / 1000000, Colors.yellow[500]),
      new ChartRecOrigemData(
          'CONTRIBUIÇÕES', widget.contri / 1000000, Colors.yellow[800]),
      new ChartRecOrigemData(
          'ALIENAÇÃO DE BENS', widget.alien / 1000000, Colors.indigo[300]),
      new ChartRecOrigemData('AMORTIZAÇÃO EMPRÉSTIMOS', widget.amort / 1000000,
          Colors.indigo[500]),
    ];

    _seriesData.add(
      charts.Series(
          domainFn: (ChartRecOrigemData rec, _) => rec.tipo,
          measureFn: (ChartRecOrigemData rec, _) => rec.valor,
          id: 'Origem',
          data: _data,
          colorFn: (ChartRecOrigemData rec, _) =>
              charts.ColorUtil.fromDartColor(rec.colorval),
          labelAccessorFn: (ChartRecOrigemData rec, _) =>
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
                  outsideJustification: charts.OutsideJustification.endDrawArea,
                  horizontalFirst: false,
                  desiredMaxRows: 6,
                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                  entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.black, fontSize: 11),
                )
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

class ChartRecOrigemData {
  String tipo;
  double valor;
  Color colorval;

  ChartRecOrigemData(this.tipo, this.valor, this.colorval);
}
