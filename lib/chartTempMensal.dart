// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// ignore: must_be_immutable
class ChartTempMensal extends StatefulWidget {
  ChartTempMensal({
    Key key,
    this.desp,
    this.rec,
  }) : super(key: key);

  final Map<double, double> desp;
  final Map<double, double> rec;

  @override
  _ChartTempMensalState createState() => _ChartTempMensalState();
}

class _ChartTempMensalState extends State<ChartTempMensal> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartTempMensalData, double>> _seriesData = [];

    List<ChartTempMensalData> _dataD = [];
    List<ChartTempMensalData> _dataR = [];

    widget.desp.remove(0);
    widget.rec.remove(0);

    widget.desp.forEach((key, value) {
      _dataD.add(new ChartTempMensalData(key, value / 1000000));
    });

    widget.rec.forEach((key, value) {
      _dataR.add(new ChartTempMensalData(key, value / 1000000));
    });

    _seriesData.add(charts.Series(
        domainFn: (ChartTempMensalData rec, _) => rec.ano,
        measureFn: (ChartTempMensalData rec, _) => rec.valor,
        id: 'DESP',
        data: _dataD,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault));

    _seriesData.add(charts.Series(
        domainFn: (ChartTempMensalData rec, _) => rec.ano,
        measureFn: (ChartTempMensalData rec, _) => rec.valor,
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
              child: charts.LineChart(
            _seriesData,
            animate: false,
            defaultRenderer: new charts.LineRendererConfig(includePoints: true),
            domainAxis: new charts.NumericAxisSpec(
              tickProviderSpec:
                  new charts.BasicNumericTickProviderSpec(zeroBound: false),
              viewport: new charts.NumericExtents(1.0, 12.0),
              showAxisLine: true,
            ),
            behaviors: [new charts.PanAndZoomBehavior()],
          ))
        ],
      ),
    );
  }
}

class ChartTempMensalData {
  double ano;
  double valor;

  ChartTempMensalData(this.ano, this.valor);
}
