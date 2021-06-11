// ignore: import_of_legacy_library_into_null_safe
import 'package:fiscaliza_recife/chartTempAnual.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fiscaliza_recife/chartTempAnualComp.dart';
import 'package:fiscaliza_recife/semDados.dart';
import 'package:flutter/material.dart';

class ScrollAnual extends StatelessWidget {
  ScrollAnual({
    required this.chartTitle,
    required this.chartDecor,
    required this.loaded,
    required this.desp,
    required this.rec,
  });

  TextStyle chartTitle;
  BoxDecoration chartDecor;
  bool loaded;
  Map<double, double> desp;
  Map<double, double> rec;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 560,
          width: double.maxFinite,
          alignment: Alignment.center,
          child: ListView(padding: EdgeInsets.zero, children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Text(
                'RECEITA X DESPESAS (R\$ BILHÃO)',
                style: chartTitle,
              ),
              decoration: chartDecor,
            ),
            loaded
                ? ChartTempAnual(
                    desp: desp,
                    rec: rec,
                  )
                : SemDados(),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Text(
                'COMPARATIVO DE MOVIMENTAÇÃO',
                style: chartTitle,
              ),
              decoration: chartDecor,
            ),
            loaded
                ? ChartTempAnualComp(
                    desp: desp,
                    rec: rec,
                  )
                : SemDados(),
          ])),
    );
  }
}
