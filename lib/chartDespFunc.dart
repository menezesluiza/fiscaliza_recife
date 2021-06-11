// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fiscaliza_recife/funcoes.dart';

class ChartDespFuncao extends StatefulWidget {
  ChartDespFuncao({
    Key key,
    this.adminis,
    this.assSocial,
    this.cieTec,
    this.comServ,
    this.cultura,
    this.desporLaz,
    this.educ,
    this.encarg,
    this.essJustica,
    this.gestAmb,
    this.habit,
    this.prevSocial,
    this.sane,
    this.saude,
    this.segPub,
    this.trab,
    this.urbanismo,
    this.dirCid,
  }) : super(key: key);

  final double adminis;
  final double assSocial;
  final double cieTec;
  final double comServ;
  final double cultura;
  final double desporLaz;
  final double educ;
  final double encarg;
  final double essJustica;
  final double gestAmb;
  final double habit;
  final double prevSocial;
  final double sane;
  final double saude;
  final double segPub;
  final double trab;
  final double urbanismo;
  final double dirCid;

  @override
  _ChartDespFuncaoState createState() => _ChartDespFuncaoState();
}

class _ChartDespFuncaoState extends State<ChartDespFuncao> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartDespFuncaoData, String>> _seriesData = [];
    var _data = [
      new ChartDespFuncaoData(
          'ADMINISTRAÇÃO', widget.adminis, Colors.amber[800]),
      new ChartDespFuncaoData(
          'ASS. SOCIAL', widget.assSocial, Colors.amber[800]),
      new ChartDespFuncaoData(
          'CIÊNCIA E TEC.', widget.cieTec, Colors.amber[800]),
      new ChartDespFuncaoData('CIDADANIA', widget.dirCid, Colors.amber[800]),
      new ChartDespFuncaoData(
          'COMÉRCIO SERV.', widget.comServ, Colors.amber[800]),
      new ChartDespFuncaoData('CULTURA', widget.cultura, Colors.amber[800]),
      new ChartDespFuncaoData(
          'DESP. E LAZER', widget.desporLaz, Colors.amber[800]),
      new ChartDespFuncaoData('EDUCAÇÃO', widget.educ, Colors.amber[800]),
      new ChartDespFuncaoData(
          'ENCARGOS ESP.', widget.encarg, Colors.amber[800]),
      new ChartDespFuncaoData(
          'ESS. À JUSTIÇA', widget.essJustica, Colors.amber[800]),
      new ChartDespFuncaoData(
          'GEST. AMBIENTAL', widget.gestAmb, Colors.amber[800]),
      new ChartDespFuncaoData('HABITAÇÃO', widget.habit, Colors.amber[800]),
      new ChartDespFuncaoData(
          'PREV. SOCIAL ', widget.prevSocial, Colors.amber[800]),
      new ChartDespFuncaoData('SANEAMENTO', widget.sane, Colors.amber[800]),
      new ChartDespFuncaoData('SAÚDE', widget.saude, Colors.amber[800]),
      new ChartDespFuncaoData('SEG. PÚBLICA', widget.segPub, Colors.amber[800]),
      new ChartDespFuncaoData('TRABALHO', widget.trab, Colors.amber[800]),
      new ChartDespFuncaoData('URBANISMO', widget.urbanismo, Colors.amber[800]),
    ];

    _seriesData.add(
      charts.Series(
          domainFn: (ChartDespFuncaoData rec, _) => rec.desc,
          measureFn: (ChartDespFuncaoData rec, _) => rec.valor,
          id: 'DESP',
          data: _data,
          fillColorFn: (ChartDespFuncaoData rec, _) =>
              charts.ColorUtil.fromDartColor(rec.colorval),
          labelAccessorFn: (ChartDespFuncaoData rec, _) =>
              '${getCurrency(rec.valor)}',
          insideLabelStyleAccessorFn: (ChartDespFuncaoData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.white),
                fontSize: 12,
              ),
          outsideLabelStyleAccessorFn: (ChartDespFuncaoData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.black54),
                fontSize: 12,
              )),
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      height: 600,
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

class ChartDespFuncaoData {
  String desc;
  double valor;
  Color colorval;

  ChartDespFuncaoData(this.desc, this.valor, this.colorval);
}
