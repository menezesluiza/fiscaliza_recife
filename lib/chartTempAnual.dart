// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChartTempAnual extends StatefulWidget {
  ChartTempAnual({
    Key key,
    this.desp,
    this.rec,
  }) : super(key: key);

  final Map<double, double> desp;
  final Map<double, double> rec;

  @override
  _ChartTempAnualState createState() => _ChartTempAnualState();
}

class _ChartTempAnualState extends State<ChartTempAnual> {
  void initState() {
    super.initState();
  }

  String getCurrency(value) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartTempAnualData, DateTime>> _seriesData = [];

    List<ChartTempAnualData> _dataD = [];
    List<ChartTempAnualData> _dataR = [];

    widget.desp.remove(0);
    widget.rec.remove(0);

    widget.desp.forEach((key, value) {
      _dataD.add(
          new ChartTempAnualData(new DateTime(key.toInt()), value / 1000000));
    });

    widget.rec.forEach((key, value) {
      _dataR.add(
          new ChartTempAnualData(new DateTime(key.toInt()), value / 1000000));
    });

    _seriesData.add(charts.Series(
        domainFn: (ChartTempAnualData rec, _) => rec.ano,
        measureFn: (ChartTempAnualData rec, _) => rec.valor,
        id: 'DESP',
        data: _dataD,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault));

    _seriesData.add(charts.Series(
        domainFn: (ChartTempAnualData rec, _) => rec.ano,
        measureFn: (ChartTempAnualData rec, _) => rec.valor,
        id: 'REC',
        data: _dataR,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault));

    return Container(
      padding: const EdgeInsets.all(8),
      height: 250,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: charts.TimeSeriesChart(
            _seriesData,
            animate: true,
            defaultRenderer: new charts.LineRendererConfig(includePoints: true),
          ))
        ],
      ),
    );
  }
}

class ChartTempAnualData {
  DateTime ano;
  double valor;

  ChartTempAnualData(this.ano, this.valor);
}
