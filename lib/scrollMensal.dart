import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fiscaliza_recife/chartTempMensal.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fiscaliza_recife/chartTempMensalComp.dart';
import 'package:fiscaliza_recife/semDados.dart';

class ScrollMensal extends StatelessWidget {
  ScrollMensal({
    required this.chartTitle,
    required this.chartDecor,
    required this.loaded,
    required this.despMensal,
    required this.recMensal,
  });

  final TextStyle chartTitle;
  final BoxDecoration chartDecor;
  final bool loaded;
  final Map<double, double> despMensal;
  final Map<double, double> recMensal;

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
                'RECEITA X DESPESAS (R\$ MILHÃO)',
                style: chartTitle,
              ),
              decoration: chartDecor,
            ),
            loaded
                ? ChartTempMensal(
                    desp: despMensal,
                    rec: recMensal,
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
                ? ChartTempMensalComp(
                    desp: despMensal,
                    rec: recMensal,
                  )
                : SemDados(),
          ])),
    );
  }
}
