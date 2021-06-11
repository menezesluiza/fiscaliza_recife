// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fiscaliza_recife/funcoes.dart';

class ChartRecCategoria extends StatefulWidget {
  const ChartRecCategoria({
    Key key,
    this.recArrec,
    this.recCorrente,
    this.recCapital,
    this.recCorrenteInfra,
  }) : super(key: key);

  final double recArrec;
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

  String _getPercentual(double value) {
    var _percn = value * 100 / widget.recArrec;
    return _percn.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartRecCategoriaData, String>> _seriesData = [];

    List<ChartRecCategoriaData> _data = [];

    if (widget.recCorrente > 0) {
      _data.add(new ChartRecCategoriaData(
          'CORRENTE: ${getCurrency(widget.recCorrente)}',
          widget.recCorrente,
          Colors.orange[200]));
    }
    if (widget.recCapital > 0) {
      _data.add(new ChartRecCategoriaData(
          'CAPITAL: ${getCurrency(widget.recCapital)}',
          widget.recCapital,
          Colors.orange[500]));
    }
    if (widget.recCorrenteInfra > 0) {
      _data.add(new ChartRecCategoriaData(
          'CORR.INTRAORÇAMENTÁRIAS: ${getCurrency(widget.recCorrenteInfra)}',
          widget.recCorrenteInfra,
          Colors.orange[800]));
    }

    _seriesData.add(
      charts.Series(
          domainFn: (ChartRecCategoriaData rec, _) => rec.tipo,
          measureFn: (ChartRecCategoriaData rec, _) => rec.valor,
          id: 'Receitas',
          data: _data,
          insideLabelStyleAccessorFn: (ChartRecCategoriaData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.black87),
                fontSize: 13,
              ),
          outsideLabelStyleAccessorFn: (ChartRecCategoriaData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.black87),
                fontSize: 13,
              ),
          colorFn: (ChartRecCategoriaData rec, _) =>
              charts.ColorUtil.fromDartColor(rec.colorval),
          labelAccessorFn: (ChartRecCategoriaData rec, _) =>
              '${_getPercentual(rec.valor)}%'),
    );

    return Container(
      padding: const EdgeInsets.all(8),
      height: 400,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                  outsideJustification: charts.OutsideJustification.start,
                  horizontalFirst: false,
                  desiredMaxRows: 3,
                  position: charts.BehaviorPosition.bottom,
                  cellPadding:
                      new EdgeInsets.only(bottom: 4, right: 0, left: 0),
                  entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.black, fontSize: 13),
                )
              ],
              defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: 200,
                arcRendererDecorators: [
                  new charts.ArcLabelDecorator(
                      showLeaderLines: true,
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

class ChartRecCategoriaData {
  String tipo;
  double valor;
  Color colorval;

  ChartRecCategoriaData(this.tipo, this.valor, this.colorval);
}
