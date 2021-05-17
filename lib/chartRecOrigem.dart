// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartRecOrigem extends StatefulWidget {
  ChartRecOrigem({
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

  double transfCorr;
  double impostos;
  double outrasCred;
  double opCredito;
  double outrasCap;
  double recPatri;
  double recServ;
  double transfCap;
  double contri;
  double alien;
  double amort;

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

    List<ChartRecOrigemData> _data = [];

    if (widget.transfCorr > 0) {
      _data.add(new ChartRecOrigemData(
          'TRANSF CORRENTES', widget.transfCorr, Colors.blue[300]));
    }
    if (widget.impostos > 0) {
      _data.add(new ChartRecOrigemData(
          'IMPOSTOS E TAXAS', widget.impostos, Colors.blue[500]));
    }
    if (widget.outrasCred > 0) {
      _data.add(new ChartRecOrigemData(
          'RECEITAS CORRENTES', widget.outrasCred, Colors.blue[800]));
    }
    if (widget.opCredito > 0) {
      _data.add(
        new ChartRecOrigemData(
            'OPERAÇÕES DE CRÉDITO', widget.opCredito, Colors.green[300]),
      );
    }
    if (widget.outrasCap > 0) {
      _data.add(
        new ChartRecOrigemData(
            'RECEITAS DE CAPITAL', widget.outrasCap, Colors.green[500]),
      );
    }
    if (widget.recPatri > 0) {
      _data.add(
        new ChartRecOrigemData(
            'RECEITA PATRIMONIAL', widget.recPatri, Colors.green[800]),
      );
    }
    if (widget.recServ > 0) {
      _data.add(
        new ChartRecOrigemData(
            'RECEITA DE SERVIÇOS', widget.recServ, Colors.yellow[300]),
      );
    }
    if (widget.transfCap > 0) {
      _data.add(
        new ChartRecOrigemData(
            'TRANSF DE CAPITAL', widget.transfCap, Colors.yellow[500]),
      );
    }
    if (widget.contri > 0) {
      _data.add(
        new ChartRecOrigemData(
            'CONTRIBUIÇÕES', widget.contri, Colors.yellow[800]),
      );
    }
    if (widget.alien > 0) {
      _data.add(
        new ChartRecOrigemData(
            'ALIENAÇÃO DE BENS', widget.alien, Colors.indigo[300]),
      );
    }
    if (widget.amort > 0) {
      _data.add(
        new ChartRecOrigemData(
            'AMORTIZAÇÃO EMPRÉSTIMOS', widget.amort, Colors.indigo[500]),
      );
    }

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
      height: 500,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: charts.PieChart(
              _seriesData,
              animate: true,
              animationDuration: Duration(seconds: 2),
              behaviors: [
                new charts.DatumLegend(
                  outsideJustification:
                      charts.OutsideJustification.middleDrawArea,
                  horizontalFirst: false,
                  desiredMaxRows: 6,
                  cellPadding:
                      new EdgeInsets.only(bottom: 4, right: 4, left: 4),
                  entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.black, fontSize: 13),
                )
              ],
              defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: 200,
                arcRendererDecorators: [
                  new charts.ArcLabelDecorator(
                      labelPosition: charts.ArcLabelPosition.outside),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChartRecOrigemData {
  String tipo;
  double valor;
  Color colorval;

  ChartRecOrigemData(this.tipo, this.valor, this.colorval);
}
