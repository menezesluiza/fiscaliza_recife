// @dart=2.9
import 'package:fiscaliza_recife/chartRecCategoria.dart';
import 'package:fiscaliza_recife/chartRecMensal.dart';
import 'package:fiscaliza_recife/chartRecOrigem.dart';
import 'package:fiscaliza_recife/chartRecPrecArrec.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'SemRecArrec.dart';

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

  @override
  void initState() {
    super.initState();
    _loadOrgaosR();
    _getData();
  }

  String dropdownValueR = '2021';
  List<String> anosR = [
    '2021',
    '2020'
  ]; //, '2019', '2018', '2017', '2016', '2015'
  String orgaoR = 'TODOS OS ÓRGÃOS';
  Map<String, String> orgaosR2021 = {'0': 'TODOS OS ÓRGÃOS'};
  Map<String, String> orgaosR2020 = {'0': 'TODOS OS ÓRGÃOS'};
  Map<String, String> orgaosR2019 = {'0': 'TODOS OS ÓRGÃOS'};
  String orgaoCod = '0';

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

  void _loadOrgaosR() {
    anosR.forEach((element) {
      FirebaseFirestore.instance
          .collection('orgaos_receitas')
          .where('ano', isEqualTo: element)
          //.orderBy('id')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (doc['orgao_codigo'] != '0') {
            _returnOrgaoList(element)
                .addAll({doc['orgao_codigo']: doc['orgao_nome']});
          }
        });
      });
    });

    setState(() {});
  }

  Map<String, String> _returnOrgaoList(String ano) {
    if (ano == '2021') {
      return orgaosR2021;
    } else if (ano == '2020') {
      return orgaosR2020;
    } else if (ano == '2019') {
      return orgaosR2019;
    } else
      return null;
  }

  String _returncod(String value, String ano) {
    Map _lista = _returnOrgaoList(ano);
    var _key =
        _lista.keys.firstWhere((k) => _lista[k] == value, orElse: () => null);
    return _key;
  }

  _isZero(var value) {
    if (value == 0 || value == null) {
      return true;
    } else
      return false;
  }

  void _getData() async {
    await FirebaseFirestore.instance
        .collection('totais_receitas')
        .where('ano', isEqualTo: dropdownValueR)
        .where('orgao_codigo', isEqualTo: orgaoCod)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _isZero(doc['recarrec'])
            ? recArrec = 0
            : recArrec = double.parse(doc['recarrec'].toString());
        _isZero(doc['recprev'])
            ? recPrev = 0
            : recPrev = double.parse(doc['recprev'].toString());
        _isZero(doc['recarrecjan'])
            ? recArrecJan = 0
            : recArrecJan = double.parse(doc['recarrecjan'].toString());
        _isZero(doc['recarrecfev'])
            ? recArrecFev = 0
            : recArrecFev = double.parse(doc['recarrecfev'].toString());
        _isZero(doc['recarrecmar'])
            ? recArrecMar = 0
            : recArrecMar = double.parse(doc['recarrecmar'].toString());
        _isZero(doc['recarrecabr'])
            ? recArrecAbr = 0
            : recArrecAbr = double.parse(doc['recarrecabr'].toString());
        _isZero(doc['recarrecmai'])
            ? recArrecMai = 0
            : recArrecMai = double.parse(doc['recarrecmai'].toString());
        _isZero(doc['recarrecjun'])
            ? recArrecJun = 0
            : recArrecJun = double.parse(doc['recarrecjun'].toString());
        _isZero(doc['recarrecjul'])
            ? recArrecJul = 0
            : recArrecJul = double.parse(doc['recarrecjul'].toString());
        _isZero(doc['recarrecago'])
            ? recArrecAgo = 0
            : recArrecAgo = double.parse(doc['recarrecago'].toString());
        _isZero(doc['recarrecset'])
            ? recArrecSet = 0
            : recArrecSet = double.parse(doc['recarrecset'].toString());
        _isZero(doc['recarrecout'])
            ? recArrecOut = 0
            : recArrecOut = double.parse(doc['recarrecout'].toString());
        _isZero(doc['recarrecnov'])
            ? recArrecNov = 0
            : recArrecNov = double.parse(doc['recarrecnov'].toString());
        _isZero(doc['recarrecdez'])
            ? recArrecDez = 0
            : recArrecDez = double.parse(doc['recarrecdez'].toString());
        _isZero(doc['reccorrente'])
            ? recCorrente = 0
            : recCorrente = double.parse(doc['reccorrente'].toString());
        _isZero(doc['reccapital'])
            ? recCapital = 0
            : recCapital = double.parse(doc['reccapital'].toString());
        _isZero(doc['reccorrenteinfra'])
            ? recCorrenteInfra = 0
            : recCorrenteInfra =
                double.parse(doc['reccorrenteinfra'].toString());
        _isZero(doc['transfcorr'])
            ? transfCorr = 0
            : transfCorr = double.parse(doc['transfcorr'].toString());
        _isZero(doc['impostos'])
            ? impostos = 0
            : impostos = double.parse(doc['impostos'].toString());
        _isZero(doc['outrascred'])
            ? outrasCred = 0
            : outrasCred = double.parse(doc['outrascred'].toString());
        _isZero(doc['opcredito'])
            ? opCredito = 0
            : opCredito = double.parse(doc['opcredito'].toString());
        _isZero(doc['outrascap'])
            ? outrasCap = 0
            : outrasCap = double.parse(doc['outrascap'].toString());
        _isZero(doc['recpatri'])
            ? recPatri = 0
            : recPatri = double.parse(doc['recpatri'].toString());
        _isZero(doc['recserv'])
            ? recServ = 0
            : recServ = double.parse(doc['recserv'].toString());
        _isZero(doc['transfcap'])
            ? transfCap = 0
            : transfCap = double.parse(doc['transfcap'].toString());
        _isZero(doc['contri'])
            ? contri = 0
            : contri = double.parse(doc['contri'].toString());
        _isZero(doc['alien'])
            ? alien = 0
            : alien = double.parse(doc['alien'].toString());
        _isZero(doc['amort'])
            ? amort = 0
            : amort = double.parse(doc['amort'].toString());
      });
    });

    FirebaseFirestore.instance.terminate();
    setState(() {});
  }

  _semReceita(double rec) {
    if (rec > 0) {
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                //ANO
                height: 45,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: new BorderRadius.circular(5)),
                padding: EdgeInsets.fromLTRB(14, 0, 0, 4),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValueR,
                    elevation: 8,
                    dropdownColor: Colors.grey[300],
                    style: TextStyle(color: Colors.black87),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValueR = newValue;
                        orgaoCod = '0';
                        orgaoR = 'TODOS OS ÓRGÃOS';
                        _getData();
                      });
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
                //ORGAOS
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
                          orgaoCod = _returncod(newValue, dropdownValueR);
                          _getData();
                        });
                      },
                      items: _returnOrgaoList(dropdownValueR)
                          .values
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
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
                    'RECEITA ARRECADADA X PREVISTA',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                ChartRecPrevArrec(recPrev: recPrev, recArrec: recArrec),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'RECEITA ARRECADADA POR MÊS',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                _semReceita(recArrec)
                    ? ChartRecPrevMensal(
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
                      )
                    : SemRecArrec(),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'RECEITA POR CATEGORIA',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                _semReceita(recArrec)
                    ? ChartRecCategoria(
                        recArrec: recArrec,
                        recCorrente: recCorrente,
                        recCapital: recCapital,
                        recCorrenteInfra: recCorrenteInfra,
                      )
                    : SemRecArrec(),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'RECEITA POR FONTE DE ORIGEM',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                _semReceita(recArrec)
                    ? ChartRecOrigem(
                        recArrec: recArrec,
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
                      )
                    : SemRecArrec(),
              ])),
        ),
      ],
    );
  }
}
