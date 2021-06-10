// @dart=2.9
import 'package:fiscaliza_recife/chartTempAnual.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  var loaded = false;

  TextStyle chartTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  BoxDecoration chartDecor =
      BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26)));

  void _getDataRec() async {
    await FirebaseFirestore.instance
        .collection('totais_despesas')
        .where('orgao_codigo', isEqualTo: '0')
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

  void _getData() {
    _getDataDesp();
    _getDataRec();
    loaded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    items: tipos.map<DropdownMenuItem<String>>((String value) {
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
              Container(
                height: 45,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                    'RECEITA X DESPESAS',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                loaded
                    ? ChartTempAnual(
                        desp: desp,
                        rec: rec,
                      )
                    : Text('SEM DADOS'),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'COMPARATIVO MOVIMENTAÇÃO',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
              ])),
        ),
      ],
    );
  }
}
