// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fiscaliza_recife/funcoes.dart';

class ChartRecPrevArrec extends StatefulWidget {
  const ChartRecPrevArrec({
    Key key,
    this.recPrev,
    this.recArrec,
  }) : super(key: key);

  final double recPrev;
  final double recArrec;

  @override
  _ChartRecPrevArrecState createState() => _ChartRecPrevArrecState();
}

class _ChartRecPrevArrecState extends State<ChartRecPrevArrec> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartRecPrevArrecData, String>> _seriesData = [];

    var _data = [
      new ChartRecPrevArrecData('ARRECADADA: ${getCurrency(widget.recArrec)}',
          widget.recArrec, Colors.green[700]),
      new ChartRecPrevArrecData('PREVISTA: ${getCurrency(widget.recPrev)}',
          widget.recPrev, Colors.green[200]),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (ChartRecPrevArrecData rec, _) => rec.tipo,
        measureFn: (ChartRecPrevArrecData rec, _) => rec.valor,
        id: 'Receitas',
        data: _data,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (ChartRecPrevArrecData rec, _) =>
            charts.ColorUtil.fromDartColor(rec.colorval),
        colorFn: (ChartRecPrevArrecData rec, _) =>
            charts.ColorUtil.fromDartColor(rec.colorval),
        labelAccessorFn: (ChartRecPrevArrecData rec, _) =>
            '${getCurrency(rec.valor)}',
        insideLabelStyleAccessorFn: (ChartRecPrevArrecData rec, _) =>
            new charts.TextStyleSpec(
          color: charts.ColorUtil.fromDartColor(Colors.black87),
          fontSize: 14,
        ),
        outsideLabelStyleAccessorFn: (ChartRecPrevArrecData rec, _) =>
            new charts.TextStyleSpec(
          color: charts.ColorUtil.fromDartColor(Colors.black87),
          fontSize: 14,
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(8),
      height: 280,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: charts.BarChart(
              _seriesData,
              animate: true,
              barGroupingType: charts.BarGroupingType.grouped,
              animationDuration: Duration(seconds: 1),
              vertical: true,
              domainAxis: new charts.OrdinalAxisSpec(
                renderSpec: new charts.NoneRenderSpec(),
              ),
              primaryMeasureAxis: new charts.NumericAxisSpec(
                renderSpec: new charts.GridlineRendererSpec(
                  labelAnchor: charts.TickLabelAnchor.centered,
                  minimumPaddingBetweenLabelsPx: 1,
                  labelStyle: new charts.TextStyleSpec(
                    fontSize: 11, // size in Pts.
                  ),
                ),
              ),
              behaviors: [
                new charts.DatumLegend(
                  outsideJustification: charts.OutsideJustification.start,
                  horizontalFirst: false,
                  desiredMaxRows: 12,
                  position: charts.BehaviorPosition.bottom,
                  cellPadding:
                      new EdgeInsets.only(bottom: 4, right: 4, left: 4),
                  entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.black, fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChartRecPrevArrecData {
  String tipo;
  double valor;
  Color colorval;

  ChartRecPrevArrecData(this.tipo, this.valor, this.colorval);
}
