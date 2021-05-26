// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class ChartDespMensal extends StatefulWidget {
  ChartDespMensal({
    Key key,
    this.despJan,
    this.despFev,
    this.despMar,
    this.despAbr,
    this.despMai,
    this.despJun,
    this.despJul,
    this.despAgo,
    this.despSet,
    this.despOut,
    this.despNov,
    this.despDez,
  }) : super(key: key);

  final double despJan;
  final double despFev;
  final double despMar;
  final double despAbr;
  final double despMai;
  final double despJun;
  final double despJul;
  final double despAgo;
  final double despSet;
  final double despOut;
  final double despNov;
  final double despDez;

  @override
  _ChartDespMensalState createState() => _ChartDespMensalState();
}

class _ChartDespMensalState extends State<ChartDespMensal> {
  void initState() {
    super.initState();
  }

  String getCurrency(value) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartDespMensalData, String>> _seriesData = [];
    var _data = [
      new ChartDespMensalData('JAN ', widget.despJan, Colors.red[400]),
      new ChartDespMensalData('FEV ', widget.despFev, Colors.red[400]),
      new ChartDespMensalData('MAR ', widget.despMar, Colors.red[400]),
      new ChartDespMensalData('ABR ', widget.despAbr, Colors.red[400]),
      new ChartDespMensalData('MAI', widget.despMai, Colors.red[400]),
      new ChartDespMensalData('JUN', widget.despJun, Colors.red[400]),
      new ChartDespMensalData('JUL', widget.despJul, Colors.red[400]),
      new ChartDespMensalData('AGO', widget.despAgo, Colors.red[400]),
      new ChartDespMensalData('SET', widget.despSet, Colors.red[400]),
      new ChartDespMensalData('OUT', widget.despOut, Colors.red[400]),
      new ChartDespMensalData('NOV', widget.despNov, Colors.red[400]),
      new ChartDespMensalData('DEZ', widget.despDez, Colors.red[400]),
    ];

    _seriesData.add(
      charts.Series(
          domainFn: (ChartDespMensalData rec, _) => rec.desc,
          measureFn: (ChartDespMensalData rec, _) => rec.valor,
          id: 'ARRECADADA',
          data: _data,
          fillColorFn: (ChartDespMensalData rec, _) =>
              charts.ColorUtil.fromDartColor(rec.colorval),
          labelAccessorFn: (ChartDespMensalData rec, _) =>
              '${getCurrency(rec.valor)}',
          insideLabelStyleAccessorFn: (ChartDespMensalData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.white),
                fontSize: 14,
              ),
          outsideLabelStyleAccessorFn: (ChartDespMensalData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.black54),
                fontSize: 14,
              )),
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

class ChartDespMensalData {
  String desc;
  double valor;
  Color colorval;

  ChartDespMensalData(this.desc, this.valor, this.colorval);
}
