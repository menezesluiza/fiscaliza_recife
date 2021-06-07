// @dart=2.9
import 'package:fiscaliza_recife/semDesp.dart';
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

  String dropdownValueI = '2021';
  String dropdownValueF = '2020';
  List<String> anos = [
    '2021',
    '2020'
  ]; //, '2019', '2018', '2017', '2016', '2015'

  TextStyle chartTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  BoxDecoration chartDecor =
      BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26)));

  _isZero(var value) {
    if (value == 0 || value == null) {
      return true;
    } else
      return false;
  }

  void _getData() async {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //ANO
                height: 45,
                margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                //decoration: BoxDecoration(
                //color: Colors.grey[300],
                //borderRadius: new BorderRadius.circular(5)),
                padding: EdgeInsets.fromLTRB(4, 0, 20, 4),
                alignment: Alignment.center,
                child: Text('ANÁLISE TEMPORAL:'),
              ),
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
                    value: dropdownValueI,
                    elevation: 8,
                    dropdownColor: Colors.grey[300],
                    style: TextStyle(color: Colors.black87),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValueI = newValue;
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
                    value: dropdownValueF,
                    elevation: 8,
                    dropdownColor: Colors.grey[300],
                    style: TextStyle(color: Colors.black87),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValueF = newValue;
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
                    'RECEITA X DESPESAS ANUAL',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                SemDesp(),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'RECEITA X DESPESAS MENSAL',
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
