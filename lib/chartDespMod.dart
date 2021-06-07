// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class ChartDespMod extends StatefulWidget {
  ChartDespMod({
    Key key,
    this.desp,
    this.naoInfo,
    this.dispensa,
    this.selecaoPub,
    this.concurso,
    this.pregRegPrec,
    this.concRegPrec,
    this.pregElet,
    this.inexig,
    this.credenc,
    this.pregao,
    this.convite,
    this.tomadaPreco,
    this.concorrencia,
    this.convenio,
  }) : super(key: key);

  final double desp;
  final double naoInfo;
  final double dispensa;
  final double selecaoPub;
  final double concurso;
  final double pregRegPrec;
  final double concRegPrec;
  final double pregElet;
  final double inexig;
  final double credenc;
  final double pregao;
  final double convite;
  final double tomadaPreco;
  final double concorrencia;
  final double convenio;

  @override
  _ChartDespModState createState() => _ChartDespModState();
}

class _ChartDespModState extends State<ChartDespMod> {
  void initState() {
    super.initState();
  }

  String getCurrency(value) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }

  String _getPercentual(double value) {
    var _percn = value * 100 / widget.desp;
    return _percn.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartDespModData, String>> _seriesData = [];

    List<ChartDespModData> _data = [];

    if (widget.naoInfo > 0) {
      _data.add(new ChartDespModData(
        'NÃO INFORMADA: ${getCurrency(widget.naoInfo)}',
        widget.naoInfo,
        Colors.blue[300],
      ));
    }
    if (widget.dispensa > 0) {
      _data.add(new ChartDespModData(
        'DISPENSA: ${getCurrency(widget.dispensa)}',
        widget.dispensa,
        Colors.blue[700],
      ));
    }
    if (widget.selecaoPub > 0) {
      _data.add(new ChartDespModData(
        'SELEÇÃO PÚBLICA: ${getCurrency(widget.selecaoPub)}',
        widget.selecaoPub,
        Colors.green[900],
      ));
    }
    if (widget.concurso > 0) {
      _data.add(
        new ChartDespModData(
          'CONCURSO: ${getCurrency(widget.concurso)}',
          widget.concurso,
          Colors.blue[900],
        ),
      );
    }
    if (widget.pregRegPrec > 0) {
      _data.add(
        new ChartDespModData(
          'PREGAO - REG. PREÇO: ${getCurrency(widget.pregRegPrec)}',
          widget.pregRegPrec,
          Colors.blue[100],
        ),
      );
    }
    if (widget.concRegPrec > 0) {
      _data.add(
        new ChartDespModData(
            'CONCORRENCIA - REG. PREÇO: ${getCurrency(widget.concRegPrec)}',
            widget.concRegPrec,
            Colors.yellow[700]),
      );
    }
    if (widget.pregElet > 0) {
      _data.add(
        new ChartDespModData(
            'PREGÃO ELETRÔNICO: ${getCurrency(widget.pregElet)}',
            widget.pregElet,
            Colors.yellow[400]),
      );
    }
    if (widget.inexig > 0) {
      _data.add(
        new ChartDespModData('INEXIGIBILIDADE: ${getCurrency(widget.inexig)}',
            widget.inexig, Colors.green[800]),
      );
    }
    if (widget.credenc > 0) {
      _data.add(
        new ChartDespModData('CREDENCIAMENTO: ${getCurrency(widget.credenc)}',
            widget.credenc, Colors.yellow[900]),
      );
    }
    if (widget.pregao > 0) {
      _data.add(
        new ChartDespModData('PREGÃO: ${getCurrency(widget.pregao)}',
            widget.pregao, Colors.green),
      );
    }
    if (widget.convite > 0) {
      _data.add(
        new ChartDespModData('CONVITE: ${getCurrency(widget.convite)}',
            widget.convite, Colors.green[300]),
      );
    }
    if (widget.tomadaPreco > 0) {
      _data.add(
        new ChartDespModData(
            'TOMADA DE PREÇO: ${getCurrency(widget.tomadaPreco)}',
            widget.tomadaPreco,
            Colors.green[300]),
      );
    }
    if (widget.concorrencia > 0) {
      _data.add(
        new ChartDespModData(
            'CONCORRÊNCIA: ${getCurrency(widget.concorrencia)}',
            widget.concorrencia,
            Colors.green[300]),
      );
    }
    if (widget.convenio > 0) {
      _data.add(
        new ChartDespModData('CONVÊNIO: ${getCurrency(widget.convenio)}',
            widget.convenio, Colors.green[300]),
      );
    }

    _seriesData.add(
      charts.Series(
          domainFn: (ChartDespModData rec, _) => rec.tipo,
          measureFn: (ChartDespModData rec, _) => rec.valor,
          id: 'Mod',
          data: _data,
          insideLabelStyleAccessorFn: (ChartDespModData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.black87),
                fontSize: 13,
              ),
          outsideLabelStyleAccessorFn: (ChartDespModData rec, _) =>
              new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.black87),
                fontSize: 13,
              ),
          colorFn: (ChartDespModData rec, _) =>
              charts.ColorUtil.fromDartColor(rec.colorval),
          labelAccessorFn: (ChartDespModData rec, _) =>
              '${_getPercentual(rec.valor)}%'),
    );

    return Container(
      padding: const EdgeInsets.all(8),
      height: 570,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: charts.PieChart(
              _seriesData,
              animate: true,
              animationDuration: Duration(seconds: 2),
              behaviors: [
                new charts.DatumLegend(
                  outsideJustification: charts.OutsideJustification.start,
                  horizontalFirst: false,
                  desiredMaxRows: 20,
                  position: charts.BehaviorPosition.bottom,
                  cellPadding:
                      new EdgeInsets.only(bottom: 4, right: 4, left: 4),
                  entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.black, fontSize: 14),
                )
              ],
              defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: 200,
                arcRendererDecorators: [
                  new charts.ArcLabelDecorator(
                      showLeaderLines: true,
                      labelPadding: 0,
                      labelPosition: charts.ArcLabelPosition.auto),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChartDespModData {
  String tipo;
  double valor;
  Color colorval;

  ChartDespModData(this.tipo, this.valor, this.colorval);
}
