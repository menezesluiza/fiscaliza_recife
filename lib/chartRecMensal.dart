// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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

  final num recArrecJan;
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
      new ChartRecPrevMensalData(
          'JAN ', widget.recArrecJan / 1000000, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'FEV ', widget.recArrecFev / 1000000, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'MAR ', widget.recArrecMar / 1000000, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'ABR ', widget.recArrecAbr / 1000000, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'M', widget.recArrecMai, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'J', widget.recArrecJun, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'J', widget.recArrecJul, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'A', widget.recArrecAgo, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'S', widget.recArrecSet, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'O', widget.recArrecOut, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'N', widget.recArrecNov, Colors.lightBlue[800]),
      new ChartRecPrevMensalData(
          'D', widget.recArrecDez, Colors.lightBlue[800]),
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
            '${rec.desc}: R\$ ${rec.valor.toStringAsFixed(3)} M',
      ),
    );

    return Container(
      padding: const EdgeInsets.all(8),
      //child: Text('Gráfico receitas do ano ${widget.dropdownValueR}'),
      child: Column(
        children: [
          Text('Receita Arrecadada por mês (em milhões)'),
          Expanded(
              child: charts.BarChart(
            _seriesData,
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
            animationDuration: Duration(seconds: 1),
            vertical: false,
            barRendererDecorator: new charts.BarLabelDecorator<String>(),
            domainAxis: new charts.OrdinalAxisSpec(
                renderSpec: new charts.NoneRenderSpec()),
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
