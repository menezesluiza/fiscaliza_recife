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
    this.dropdownValueR,
    this.orgaoR,
  }) : super(key: key);

  String dropdownValueR;
  String orgaoR;

  @override
  _GridRecState createState() => _GridRecState();
}

class _GridRecState extends State<GridRec> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final real = new NumberFormat("#,##0.00", "en_US");

  @override
  void initState() {
    super.initState();
    getData();
  }

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

  void getData() async {
    String _ano = 'receitas-' + widget.dropdownValueR;
    String _orgao = widget.orgaoR;
    //List<String> _dados = [];
    if (widget.orgaoR == 'TODOS OS ÓRGÃOS') {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      width: double.maxFinite,
      alignment: Alignment.center,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        children: <Widget>[
          ChartRecPrevArrec(real: real, recPrev: recPrev, recArrec: recArrec),
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
          ChartRecCategoria(
            recCorrente: recCorrente,
            recCapital: recCapital,
            recCorrenteInfra: recCorrenteInfra,
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
          InkWell(
            onTap: null,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                  'Receita Arrecadada pelo ${widget.orgaoR} ${real.format(recArrec)} em ${widget.dropdownValueR}'),
              color: Colors.orange[200],
            ),
          ),
        ],
      ),
    );
  }
}
