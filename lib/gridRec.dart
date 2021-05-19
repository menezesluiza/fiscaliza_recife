// @dart=2.9
import 'package:fiscaliza_recife/chartRecCategoria.dart';
import 'package:fiscaliza_recife/chartRecMensal.dart';
import 'package:fiscaliza_recife/chartRecOrigem.dart';
import 'package:fiscaliza_recife/chartRecPrecArrec.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class GridRec extends StatefulWidget {
  GridRec({
    Key key,
  }) : super(key: key);

  @override
  _GridRecState createState() => _GridRecState();
}

class _GridRecState extends State<GridRec> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final real = new NumberFormat("#,##0.00", "en_US");

  @override
  void initState() {
    super.initState();
    _loadOrgaosR();
    _getData();
  }

  String dropdownValueR = '2021';
  List<String> anosR = ['2021', '2020', '2019', '2018', '2017'];
  String orgaoR = 'TODOS OS ÓRGÃOS';
  List<String> orgaosR = [];

  double recArrec = 0;
  double recPrev = 0;

  double recArrecJan = 0;
  double recArrecFev = 0;
  double recArrecMar = 0;
  double recArrecAbr = 0;
  double recArrecMai = 0;
  double recArrecJun = 0;
  double recArrecJul = 0;
  double recArrecAgo = 0;
  double recArrecSet = 0;
  double recArrecOut = 0;
  double recArrecNov = 0;
  double recArrecDez = 0;

  double recCorrente = 0;
  double recCapital = 0;
  double recCorrenteInfra = 0;

  double transfCorr = 0;
  double impostos = 0;
  double outrasCred = 0;
  double opCredito = 0;
  double outrasCap = 0;
  double recPatri = 0;
  double recServ = 0;
  double transfCap = 0;
  double contri = 0;
  double alien = 0;
  double amort = 0;

  TextStyle chartTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  BoxDecoration chartDecor =
      BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26)));

  void _loadOrgaosR() async {
    String _anoOrgao = 'orgaos-' + dropdownValueR;

    await FirebaseFirestore.instance
        .collection(_anoOrgao)
        .orderBy('id')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        orgaosR.add(doc['nome']);
      });
    });
    FirebaseFirestore.instance.terminate();
    setState(() {});
  }

  void _getData() async {
    String _ano = 'receitas-' + dropdownValueR;
    String _orgao = orgaoR;
    recArrec = 0;
    recPrev = 0;
    recArrecJan = 0;
    recArrecFev = 0;
    recArrecMar = 0;
    recArrecAbr = 0;
    recArrecMai = 0;
    recArrecJun = 0;
    recArrecJul = 0;
    recArrecAgo = 0;
    recArrecSet = 0;
    recArrecOut = 0;
    recArrecNov = 0;
    recArrecDez = 0;
    recCorrente = 0;
    recCapital = 0;
    recCorrenteInfra = 0;
    transfCorr = 0;
    impostos = 0;
    outrasCred = 0;
    opCredito = 0;
    outrasCap = 0;
    recPatri = 0;
    recServ = 0;
    transfCap = 0;
    contri = 0;
    alien = 0;
    amort = 0;

    if (orgaoR == 'TODOS OS ÓRGÃOS') {
      await FirebaseFirestore.instance
          .collection(_ano)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          recPrev += double.parse(doc['receita_prevista_atualizada']
              .toString()
              .replaceAll(",", "."));
          recArrec += double.parse(
              doc['receita_arrecadada'].toString().replaceAll(",", "."));
          //MENSAL
          if (doc['mes'] == 1) {
            recArrecJan += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 2) {
            recArrecFev += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 3) {
            recArrecMar += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 4) {
            recArrecAbr += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 5) {
            recArrecMai += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 6) {
            recArrecJun += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 7) {
            recArrecJul += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 8) {
            recArrecAgo += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 9) {
            recArrecSet += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 10) {
            recArrecOut += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 11) {
            recArrecNov += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 12) {
            recArrecDez += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          }
          //CATEGORIA
          if (doc['categoria_receita_nome'] == 'RECEITAS CORRENTES') {
            recCorrente += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['categoria_receita_nome'] == 'RECEITAS DE CAPITAL') {
            recCapital += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['categoria_receita_nome'] ==
              'RECEITAS CORRENTES INTRAORÇAMENTÁRIAS') {
            recCorrenteInfra += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          }
          //ORIGEM RECEITA
          if (doc['fonte_origem_receita_nome'] == 'TRANSFERÊNCIAS CORRENTES') {
            transfCorr += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'IMPOSTOS, TAXAS E CONTRIBUIÇÕES DE MELHORIA') {
            impostos += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'OUTRAS RECEITAS CORRENTES') {
            outrasCred += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'OPERAÇÕES DE CRÉDITO') {
            opCredito += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'OUTRAS RECEITAS DE CAPITAL') {
            outrasCap += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'RECEITA PATRIMONIAL') {
            recPatri += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'RECEITA DE SERVIÇOS') {
            recServ += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'TRANSFERÊNCIAS DE CAPITAL') {
            transfCap += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] == 'CONTRIBUIÇÕES') {
            contri += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] == 'ALIENAÇÃO DE BENS') {
            alien += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'AMORTIZAÇÃO DE EMPRÉSTIMOS') {
            amort += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          }
        });
      });
    } else {
      await FirebaseFirestore.instance
          .collection(_ano)
          .where('orgao_nome', isEqualTo: _orgao)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          recPrev += double.parse(doc['receita_prevista_atualizada']
              .toString()
              .replaceAll(",", "."));
          recArrec += double.parse(
              doc['receita_arrecadada'].toString().replaceAll(",", "."));
          //MENSAL
          if (doc['mes'] == 1) {
            recArrecJan += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 2) {
            recArrecFev += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 3) {
            recArrecMar += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 4) {
            recArrecAbr += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 5) {
            recArrecMai += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 6) {
            recArrecJun += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 7) {
            recArrecJul += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 8) {
            recArrecAgo += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 9) {
            recArrecSet += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 10) {
            recArrecOut += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 11) {
            recArrecNov += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['mes'] == 12) {
            recArrecDez += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          }
          //CATEGORIA
          if (doc['categoria_receita_nome'] == 'RECEITAS CORRENTES') {
            recCorrente += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['categoria_receita_nome'] == 'RECEITAS DE CAPITAL') {
            recCapital += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['categoria_receita_nome'] ==
              'RECEITAS CORRENTES INTRAORÇAMENTÁRIAS') {
            recCorrenteInfra += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          }
          //ORIGEM RECEITA
          if (doc['fonte_origem_receita_nome'] == 'TRANSFERÊNCIAS CORRENTES') {
            transfCorr += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'IMPOSTOS, TAXAS E CONTRIBUIÇÕES DE MELHORIA') {
            impostos += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'OUTRAS RECEITAS CORRENTES') {
            outrasCred += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'OPERAÇÕES DE CRÉDITO') {
            opCredito += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'OUTRAS RECEITAS DE CAPITAL') {
            outrasCap += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'RECEITA PATRIMONIAL') {
            recPatri += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'RECEITA DE SERVIÇOS') {
            recServ += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'TRANSFERÊNCIAS DE CAPITAL') {
            transfCap += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] == 'CONTRIBUIÇÕES') {
            contri += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] == 'ALIENAÇÃO DE BENS') {
            alien += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          } else if (doc['fonte_origem_receita_nome'] ==
              'AMORTIZAÇÃO DE EMPRÉSTIMOS') {
            amort += double.parse(
                doc['receita_arrecadada'].toString().replaceAll(",", "."));
          }
        });
      });
    }
    FirebaseFirestore.instance.terminate();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                height: 45,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: new BorderRadius.circular(5)),
                padding: EdgeInsets.fromLTRB(14, 0, 0, 4),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValueR,
                    //iconSize: ,
                    elevation: 8,
                    //icon: Icon(Icons.arrow_drop_down_rounded),
                    dropdownColor: Colors.grey[300],
                    style: TextStyle(color: Colors.black87),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValueR = newValue;
                        _getData();
                      });
                      //_getData();
                    },
                    items: anosR.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 45,
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: new BorderRadius.circular(5)),
                  padding: EdgeInsets.fromLTRB(14, 0, 0, 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: orgaoR,
                      elevation: 8,
                      isExpanded: true,
                      dropdownColor: Colors.grey[300],
                      style: TextStyle(color: Colors.black87),
                      onChanged: (String newValue) {
                        setState(() {
                          orgaoR = newValue;
                          _getData();
                        });
                      },
                      items:
                          orgaosR.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(fontSize: 14)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
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
                    'RECEITA PREVISTA X ARRECADADA',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                ChartRecPrevArrec(
                    real: real, recPrev: recPrev, recArrec: recArrec),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'RECEITA ARRECADADA POR MÊS',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                ChartRecPrevMensal(
                  recArrecJan: recArrecJan,
                  recArrecFev: recArrecFev,
                  recArrecMar: recArrecMar,
                  recArrecAbr: recArrecAbr,
                  recArrecMai: recArrecMai,
                  recArrecJun: recArrecJun,
                  recArrecJul: recArrecJul,
                  recArrecAgo: recArrecAgo,
                  recArrecSet: recArrecSet,
                  recArrecOut: recArrecOut,
                  recArrecNov: recArrecNov,
                  recArrecDez: recArrecDez,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'RECEITA POR CATEGORIA',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                ChartRecCategoria(
                  recCorrente: recCorrente,
                  recCapital: recCapital,
                  recCorrenteInfra: recCorrenteInfra,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'RECEITA POR FONTE DE ORIGEM',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                ChartRecOrigem(
                  alien: alien,
                  amort: amort,
                  contri: contri,
                  impostos: impostos,
                  opCredito: opCredito,
                  outrasCap: outrasCap,
                  outrasCred: outrasCred,
                  recPatri: recPatri,
                  recServ: recServ,
                  transfCap: transfCap,
                  transfCorr: transfCorr,
                ),
              ])),
        ),
      ],
    );
  }
}
