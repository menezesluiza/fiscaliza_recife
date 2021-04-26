// @dart=2.9
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartRecPrevMensal extends StatefulWidget {
  ChartRecPrevMensal({
    Key key,
    this.real,
    this.recArrecJan,
    this.recArrecFev,
    this.recArrecMar,
    this.recArrecAbr,
  }) : super(key: key);

  final NumberFormat real;
  final double recArrecJan;
  final double recArrecFev;
  final double recArrecMar;
  final double recArrecAbr;

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
      new ChartRecPrevMensalData(
          'JAN', widget.recArrecJan, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'FEV', widget.recArrecFev, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'MAR', widget.recArrecMar, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'ABR', widget.recArrecAbr, Colors.lightBlue[800]),
    ];

    _seriesData.add(
      charts.Series(
          domainFn: (ChartRecPrevMensalData rec, _) => rec.desc,
          measureFn: (ChartRecPrevMensalData rec, _) => rec.valor,
          id: 'PREV',
          data: _data,
          fillColorFn: (ChartRecPrevMensalData rec, _) =>
              charts.ColorUtil.fromDartColor(rec.colorval)),
    );

    return Container(
      padding: const EdgeInsets.all(8),
      //child: Text('Gráfico receitas do ano ${widget.dropdownValueR}'),
      child: Column(
        children: [
          Text('Receita Prevista x Arrecadada por mês'),
          Expanded(
              child: charts.BarChart(
            _seriesData,
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
            animationDuration: Duration(seconds: 1),
          ))
        ],
      ),
      color: Colors.orange[100],
    );
  }
}

class ChartRecPrevMensalData {
  String desc;
  double valor;
  Color colorval;

  ChartRecPrevMensalData(this.desc, this.valor, this.colorval);
}
