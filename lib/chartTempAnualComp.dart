// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fiscaliza_recife/funcoes.dart';

// ignore: must_be_immutable
class ChartTempAnualComp extends StatefulWidget {
  ChartTempAnualComp({
    Key key,
    this.desp,
    this.rec,
  }) : super(key: key);

  final Map<double, double> desp;
  final Map<double, double> rec;

  @override
  _ChartTempAnualCompState createState() => _ChartTempAnualCompState();
}

class _ChartTempAnualCompState extends State<ChartTempAnualComp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartTempAnualCompData, String>> _seriesData = [];

    List<ChartTempAnualCompData> _dataD = [];
    List<ChartTempAnualCompData> _dataR = [];

    List<String> _anos = [
      '2021',
      '2020',
      '2019',
      '2018',
      '2017',
      '2016',
      '2015'
    ];

    _anos.sort();

    num _calcPercent(int x) {
      if (widget.desp.containsKey(x)) {
        return percentual(widget.desp[x], widget.rec[x]);
      } else
        return 0;
    }

    _returnIcon(num x) {
      if (x > 0) {
        return Icon(Icons.trending_up_rounded, color: Colors.green);
      } else
        return Icon(Icons.trending_down_rounded, color: Colors.red);
    }

    widget.desp.remove(0);
    widget.rec.remove(0);

    widget.desp.forEach((key, value) {
      _dataD.add(new ChartTempAnualCompData(key.toStringAsFixed(0), value));
    });

    widget.rec.forEach((key, value) {
      _dataR.add(new ChartTempAnualCompData(key.toStringAsFixed(0), value));
    });

    _seriesData.add(
      charts.Series(
          labelAccessorFn: (ChartTempAnualCompData rec, _) =>
              '${getCurrency(rec.valor)}',
          insideLabelStyleAccessorFn: (ChartTempAnualCompData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.white),
                fontSize: 13,
              ),
          outsideLabelStyleAccessorFn: (ChartTempAnualCompData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.black54),
                fontSize: 13,
              ),
          domainFn: (ChartTempAnualCompData rec, _) => rec.ano,
          measureFn: (ChartTempAnualCompData rec, _) => rec.valor,
          id: 'DESP',
          data: _dataD,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault),
    );

    _seriesData.add(charts.Series(
        labelAccessorFn: (ChartTempAnualCompData rec, _) =>
            '${getCurrency(rec.valor)}',
        insideLabelStyleAccessorFn: (ChartTempAnualCompData rec, _) =>
            new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(Colors.white),
              fontSize: 13,
            ),
        outsideLabelStyleAccessorFn: (ChartTempAnualCompData rec, _) =>
            new charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(Colors.black54),
              fontSize: 13,
            ),
        domainFn: (ChartTempAnualCompData rec, _) => rec.ano,
        measureFn: (ChartTempAnualCompData rec, _) => rec.valor,
        id: 'REC',
        data: _dataR,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 13,
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 500,
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
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(0),
            height: 510,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 38,
                ),
                for (var item in _anos)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
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

class ChartTempAnualCompData {
  String ano;
  double valor;

  ChartTempAnualCompData(this.ano, this.valor);
}
