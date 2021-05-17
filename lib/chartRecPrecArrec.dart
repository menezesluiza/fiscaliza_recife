// @dart=2.9
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartRecPrevArrec extends StatefulWidget {
  const ChartRecPrevArrec({
    Key key,
    this.real,
    this.recPrev,
    this.recArrec,
  }) : super(key: key);

  final NumberFormat real;
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
      new ChartRecPrevArrecData(
          'PREVISTA', widget.recPrev, Colors.lightBlue[300]),
      new ChartRecPrevArrecData(
          'ARRECADADA', widget.recArrec, Colors.lightBlue[800]),
    ];

    _seriesData.add(
      charts.Series(
          domainFn: (ChartRecPrevArrecData rec, _) => rec.tipo,
          measureFn: (ChartRecPrevArrecData rec, _) => rec.valor,
          id: 'Receitas',
          data: _data,
          fillPatternFn: (_, __) => charts.FillPatternType.forwardHatch,
          fillColorFn: (ChartRecPrevArrecData rec, _) =>
              charts.ColorUtil.fromDartColor(rec.colorval)),
    );

    return Container(
      padding: const EdgeInsets.all(8),
      height: 250,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: charts.BarChart(
            _seriesData,
            animate: true,
            primaryMeasureAxis: new charts.NumericAxisSpec(
              renderSpec: new charts.GridlineRendererSpec(
                labelAnchor: charts.TickLabelAnchor.after,
                labelJustification: charts.TickLabelJustification.inside,
              ),
            ),

            //barGroupingType: charts.BarGroupingType.grouped,
            animationDuration: Duration(seconds: 1),
          ))
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
