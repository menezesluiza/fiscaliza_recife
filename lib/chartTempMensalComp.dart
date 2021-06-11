// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fiscaliza_recife/funcoes.dart';

// ignore: must_be_immutable
class ChartTempMensalComp extends StatefulWidget {
  ChartTempMensalComp({
    Key key,
    this.desp,
    this.rec,
  }) : super(key: key);

  final Map<double, double> desp;
  final Map<double, double> rec;

  @override
  _ChartTempMensalCompState createState() => _ChartTempMensalCompState();
}

class _ChartTempMensalCompState extends State<ChartTempMensalComp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartTempMensalCompData, String>> _seriesData = [];

    List<ChartTempMensalCompData> _dataD = [];
    List<ChartTempMensalCompData> _dataR = [];

    widget.desp.remove(0);
    widget.rec.remove(0);

    widget.desp.forEach((key, value) {
      _dataD.add(new ChartTempMensalCompData(key.toStringAsFixed(0), value));
    });

    widget.rec.forEach((key, value) {
      _dataR.add(new ChartTempMensalCompData(key.toStringAsFixed(0), value));
    });

    _seriesData.add(
      charts.Series(
          labelAccessorFn: (ChartTempMensalCompData rec, _) =>
              '${getCurrency(rec.valor)}',
          insideLabelStyleAccessorFn: (ChartTempMensalCompData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.white),
                fontSize: 14,
              ),
          outsideLabelStyleAccessorFn: (ChartTempMensalCompData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.black54),
                fontSize: 14,
              ),
          domainFn: (ChartTempMensalCompData rec, _) => rec.ano,
          measureFn: (ChartTempMensalCompData rec, _) => rec.valor,
          id: 'DESP',
          data: _dataD,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );

    _seriesData.add(charts.Series(
        labelAccessorFn: (ChartTempMensalCompData rec, _) =>
            '${getCurrency(rec.valor)}',
        insideLabelStyleAccessorFn: (ChartTempMensalCompData rec, _) =>
            new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(Colors.white),
              fontSize: 14,
            ),
        outsideLabelStyleAccessorFn: (ChartTempMensalCompData rec, _) =>
            new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(Colors.black54),
              fontSize: 14,
            ),
        domainFn: (ChartTempMensalCompData rec, _) => rec.ano,
        measureFn: (ChartTempMensalCompData rec, _) => rec.valor,
        id: 'REC',
        data: _dataR,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault));

    return Container(
      padding: const EdgeInsets.all(8),
      height: 750,
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

class ChartTempMensalCompData {
  String ano;
  double valor;

  ChartTempMensalCompData(this.ano, this.valor);
}
