// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fiscaliza_recife/funcoes.dart';

class ChartRecPrevMensal extends StatefulWidget {
  ChartRecPrevMensal({
    Key key,
    this.recArrecJan,
    this.recArrecFev,
    this.recArrecMar,
    this.recArrecAbr,
    this.recArrecMai,
    this.recArrecJun,
    this.recArrecJul,
    this.recArrecAgo,
    this.recArrecSet,
    this.recArrecOut,
    this.recArrecNov,
    this.recArrecDez,
  }) : super(key: key);

  final double recArrecJan;
  final double recArrecFev;
  final double recArrecMar;
  final double recArrecAbr;
  final double recArrecMai;
  final double recArrecJun;
  final double recArrecJul;
  final double recArrecAgo;
  final double recArrecSet;
  final double recArrecOut;
  final double recArrecNov;
  final double recArrecDez;

  @override
  _ChartRecPrevMensalState createState() => _ChartRecPrevMensalState();
}

class _ChartRecPrevMensalState extends State<ChartRecPrevMensal> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartRecPrevMensalData, String>> _seriesData = [];
    var _data = [
      new ChartRecPrevMensalData('JAN ', widget.recArrecJan, Colors.green[500]),
      new ChartRecPrevMensalData('FEV ', widget.recArrecFev, Colors.green[500]),
      new ChartRecPrevMensalData('MAR ', widget.recArrecMar, Colors.green[500]),
      new ChartRecPrevMensalData('ABR ', widget.recArrecAbr, Colors.green[500]),
      new ChartRecPrevMensalData('MAI', widget.recArrecMai, Colors.green[500]),
      new ChartRecPrevMensalData('JUN', widget.recArrecJun, Colors.green[500]),
      new ChartRecPrevMensalData('JUL', widget.recArrecJul, Colors.green[500]),
      new ChartRecPrevMensalData('AGO', widget.recArrecAgo, Colors.green[500]),
      new ChartRecPrevMensalData('SET', widget.recArrecSet, Colors.green[500]),
      new ChartRecPrevMensalData('OUT', widget.recArrecOut, Colors.green[500]),
      new ChartRecPrevMensalData('NOV', widget.recArrecNov, Colors.green[500]),
      new ChartRecPrevMensalData('DEZ', widget.recArrecDez, Colors.green[500]),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (ChartRecPrevMensalData rec, _) => rec.desc,
        measureFn: (ChartRecPrevMensalData rec, _) => rec.valor,
        id: 'ARRECADADA',
        data: _data,
        fillColorFn: (ChartRecPrevMensalData rec, _) =>
            charts.ColorUtil.fromDartColor(rec.colorval),
        labelAccessorFn: (ChartRecPrevMensalData rec, _) =>
            '${getCurrency(rec.valor)}',
        insideLabelStyleAccessorFn: (ChartRecPrevMensalData rec, _) =>
            new charts.TextStyleSpec(
          color: charts.ColorUtil.fromDartColor(Colors.white),
          fontSize: 14,
        ),
        outsideLabelStyleAccessorFn: (ChartRecPrevMensalData rec, _) =>
            new charts.TextStyleSpec(
          color: charts.ColorUtil.fromDartColor(Colors.black54),
          fontSize: 14,
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(8),
      height: 450,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: charts.BarChart(
              _seriesData,
              animate: true,
              defaultRenderer: new charts.BarRendererConfig(
                barRendererDecorator: new charts.BarLabelDecorator(
                    labelPosition: charts.BarLabelPosition.auto),
              ),
              barGroupingType: charts.BarGroupingType.grouped,
              animationDuration: Duration(seconds: 1),
              vertical: false,
              barRendererDecorator: new charts.BarLabelDecorator<String>(),
              domainAxis: new charts.OrdinalAxisSpec(
                renderSpec: new charts.SmallTickRendererSpec(
                  labelStyle: new charts.TextStyleSpec(
                    fontSize: 12,
                  ),
                ),
                showAxisLine: true,
              ),
              primaryMeasureAxis: new charts.NumericAxisSpec(
                renderSpec: new charts.GridlineRendererSpec(
                  labelAnchor: charts.TickLabelAnchor.before,
                  minimumPaddingBetweenLabelsPx: 10,
                  labelStyle: new charts.TextStyleSpec(
                    fontSize: 12, // size in Pts.
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChartRecPrevMensalData {
  String desc;
  double valor;
  Color colorval;

  ChartRecPrevMensalData(this.desc, this.valor, this.colorval);
}
