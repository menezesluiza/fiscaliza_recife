// @dart=2.9

import 'package:fiscaliza_recife/scrollAnual.dart';
import 'package:fiscaliza_recife/scrollMensal.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'funcoes.dart';

// ignore: must_be_immutable
class GridTemp extends StatefulWidget {
  GridTemp({
    Key key,
  }) : super(key: key);

  @override
  _GridTempState createState() => _GridTempState();
}

class _GridTempState extends State<GridTemp> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  String dropdownValue = '2021';
  String dropTipo = 'ANÁLISE TEMPORAL POR ANO';
  List<String> anos = ['2021', '2020', '2019', '2018', '2017', '2016', '2015'];

  List<String> tipos = ['ANÁLISE TEMPORAL POR ANO', 'ANÁLISE TEMPORAL POR MÊS'];

  Map<double, double> desp = {0: 0};
  Map<double, double> rec = {0: 0};

  Map<double, double> despMensal = {0: 0};
  Map<double, double> recMensal = {0: 0};

  double despJan = 0;
  double despFev = 0;
  double despMar = 0;
  double despAbr = 0;
  double despMai = 0;
  double despJun = 0;
  double despJul = 0;
  double despAgo = 0;
  double despSet = 0;
  double despOut = 0;
  double despNov = 0;
  double despDez = 0;
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

  var loaded = false;

  void _getDataRec() async {
    await FirebaseFirestore.instance
        .collection('totais_despesas')
        .where('orgao_codigo', isEqualTo: '0')
        .orderBy('ano_mov')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        desp.addAll({
          double.parse(doc['ano_mov'].toString()):
              double.parse(doc['desp'].toString())
        });

        setState(() {});
      });
    });
  }

  void _getDataDesp() async {
    await FirebaseFirestore.instance
        .collection('totais_receitas')
        .where('orgao_codigo', isEqualTo: '0')
        .orderBy('ano')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        rec.addAll({
          double.parse(doc['ano'].toString()):
              double.parse(doc['recarrec'].toString())
        });

        setState(() {});
      });
    });
  }

  void _getDataDespMensal() async {
    await FirebaseFirestore.instance
        .collection('totais_despesas')
        .where('orgao_codigo', isEqualTo: '0')
        .where('ano_mov', isEqualTo: dropdownValue)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        isZero(doc['despjan'])
            ? despJan = 0
            : despJan = double.parse(doc['despjan'].toString());
        isZero(doc['despfev'])
            ? despFev = 0
            : despFev = double.parse(doc['despfev'].toString());
        isZero(doc['despmar'])
            ? despMar = 0
            : despMar = double.parse(doc['despmar'].toString());
        isZero(doc['despabr'])
            ? despAbr = 0
            : despAbr = double.parse(doc['despabr'].toString());
        isZero(doc['despmai'])
            ? despMai = 0
            : despMai = double.parse(doc['despmai'].toString());
        isZero(doc['despjun'])
            ? despJun = 0
            : despJun = double.parse(doc['despjun'].toString());
        isZero(doc['despjul'])
            ? despJul = 0
            : despJul = double.parse(doc['despjul'].toString());
        isZero(doc['despago'])
            ? despAgo = 0
            : despAgo = double.parse(doc['despago'].toString());
        isZero(doc['despset'])
            ? despSet = 0
            : despSet = double.parse(doc['despset'].toString());
        isZero(doc['despout'])
            ? despOut = 0
            : despOut = double.parse(doc['despout'].toString());
        isZero(doc['despnov'])
            ? despNov = 0
            : despNov = double.parse(doc['despnov'].toString());
        isZero(doc['despdez'])
            ? despDez = 0
            : despDez = double.parse(doc['despdez'].toString());

        despMensal.addAll({1: despJan});
        despMensal.addAll({2: despFev});
        despMensal.addAll({3: despMar});
        despMensal.addAll({4: despAbr});
        despMensal.addAll({5: despMai});
        despMensal.addAll({6: despJun});
        despMensal.addAll({7: despJul});
        despMensal.addAll({8: despAgo});
        despMensal.addAll({9: despSet});
        despMensal.addAll({10: despOut});
        despMensal.addAll({11: despNov});
        despMensal.addAll({12: despDez});

        setState(() {});
      });
    });
  }

  void _getDataRecMensal() async {
    await FirebaseFirestore.instance
        .collection('totais_receitas')
        .where('orgao_codigo', isEqualTo: '0')
        .where('ano', isEqualTo: dropdownValue)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        isZero(doc['recarrecjan'])
            ? recArrecJan = 0
            : recArrecJan = double.parse(doc['recarrecjan'].toString());
        isZero(doc['recarrecfev'])
            ? recArrecFev = 0
            : recArrecFev = double.parse(doc['recarrecfev'].toString());
        isZero(doc['recarrecmar'])
            ? recArrecMar = 0
            : recArrecMar = double.parse(doc['recarrecmar'].toString());
        isZero(doc['recarrecabr'])
            ? recArrecAbr = 0
            : recArrecAbr = double.parse(doc['recarrecabr'].toString());
        isZero(doc['recarrecmai'])
            ? recArrecMai = 0
            : recArrecMai = double.parse(doc['recarrecmai'].toString());
        isZero(doc['recarrecjun'])
            ? recArrecJun = 0
            : recArrecJun = double.parse(doc['recarrecjun'].toString());
        isZero(doc['recarrecjul'])
            ? recArrecJul = 0
            : recArrecJul = double.parse(doc['recarrecjul'].toString());
        isZero(doc['recarrecago'])
            ? recArrecAgo = 0
            : recArrecAgo = double.parse(doc['recarrecago'].toString());
        isZero(doc['recarrecset'])
            ? recArrecSet = 0
            : recArrecSet = double.parse(doc['recarrecset'].toString());
        isZero(doc['recarrecout'])
            ? recArrecOut = 0
            : recArrecOut = double.parse(doc['recarrecout'].toString());
        isZero(doc['recarrecnov'])
            ? recArrecNov = 0
            : recArrecNov = double.parse(doc['recarrecnov'].toString());
        isZero(doc['recarrecdez'])
            ? recArrecDez = 0
            : recArrecDez = double.parse(doc['recarrecdez'].toString());
        recMensal.addAll({1: recArrecJan});
        recMensal.addAll({2: recArrecFev});
        recMensal.addAll({3: recArrecMar});
        recMensal.addAll({4: recArrecAbr});
        recMensal.addAll({5: recArrecMai});
        recMensal.addAll({6: recArrecJun});
        recMensal.addAll({7: recArrecJul});
        recMensal.addAll({8: recArrecAgo});
        recMensal.addAll({9: recArrecSet});
        recMensal.addAll({10: recArrecOut});
        recMensal.addAll({11: recArrecNov});
        recMensal.addAll({12: recArrecDez});
        setState(() {});
      });
    });
  }

  void _getData() {
    _getDataDesp();
    _getDataRec();
    _getDataDespMensal();
    _getDataRecMensal();
    loaded = true;
  }

  _isAnual(String value) {
    if (value == 'ANÁLISE TEMPORAL POR ANO') {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  height: 45,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: new BorderRadius.circular(5)),
                  padding: EdgeInsets.fromLTRB(14, 0, 0, 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropTipo,
                      elevation: 8,
                      dropdownColor: Colors.grey[300],
                      style: TextStyle(color: Colors.black87),
                      onChanged: (String newValue) {
                        setState(() {
                          dropTipo = newValue;
                          _getData();
                        });
                      },
                      items:
                          tipos.map<DropdownMenuItem<String>>((String value) {
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
              ),
              Container(
                height: 45,
                margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: new BorderRadius.circular(5)),
                padding: EdgeInsets.fromLTRB(14, 0, 0, 4),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 8,
                    dropdownColor: Colors.grey[300],
                    style: TextStyle(color: Colors.black87),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        _getData();
                      });
                    },
                    items: anos.map<DropdownMenuItem<String>>((String value) {
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
            ],
          ),
        ),
        _isAnual(dropTipo)
            ? ScrollAnual(
                chartTitle: chartTitle,
                chartDecor: chartDecor,
                loaded: loaded,
                desp: desp,
                rec: rec)
            : ScrollMensal(
                chartTitle: chartTitle,
                chartDecor: chartDecor,
                loaded: loaded,
                despMensal: despMensal,
                recMensal: recMensal),
      ],
    );
  }
}
