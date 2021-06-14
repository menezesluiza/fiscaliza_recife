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

    List<String> _meses = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12'
    ];

    widget.desp.remove(0);
    widget.rec.remove(0);

    num _calcPercent(int x) {
      if (widget.desp.containsKey(x) &&
          widget.desp[x] != 0 &&
          widget.rec[x] != 0) {
        return percentual(widget.desp[x], widget.rec[x]).round();
      } else
        return 0;
    }

    _returnIcon(num x) {
      if (x > 0) {
        return Icon(Icons.trending_up_rounded, color: Colors.green);
      } else if (x < 0) {
        return Icon(Icons.trending_down_rounded, color: Colors.red);
      } else
        return Icon(Icons.compare_arrows_rounded, color: Colors.white);
    }

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
                fontSize: 12,
              ),
          outsideLabelStyleAccessorFn: (ChartTempMensalCompData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.black54),
                fontSize: 12,
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
              fontSize: 12,
            ),
        outsideLabelStyleAccessorFn: (ChartTempMensalCompData rec, _) =>
            new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(Colors.black54),
              fontSize: 12,
            ),
        domainFn: (ChartTempMensalCompData rec, _) => rec.ano,
        measureFn: (ChartTempMensalCompData rec, _) => rec.valor,
        id: 'REC',
        data: _dataR,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 12,
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 822,
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
                    barRendererDecorator:
                        new charts.BarLabelDecorator<String>(),
                    domainAxis: new charts.OrdinalAxisSpec(
                      renderSpec: new charts.SmallTickRendererSpec(
                        labelStyle: new charts.TextStyleSpec(
                          fontSize: 10,
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
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 822,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 38,
                ),
                for (var item in _meses)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${_calcPercent(int.parse(item)).abs().toStringAsFixed(0)}%',
                            style: percentText,
                          ),
                          _returnIcon(_calcPercent(int.parse(item))),
                        ],
                      ),
                      Container(
                        height: 40,
                      ),
                    ],
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChartTempMensalCompData {
  String ano;
  double valor;

  ChartTempMensalCompData(this.ano, this.valor);
}
