// @dart=2.9
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

  void getData() async {
    String _ano = 'receitas-' + widget.dropdownValueR;
    String _orgao = widget.orgaoR;
    //List<String> _dados = [];
    if (widget.orgaoR == 'TODOS') {
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
        });
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
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
            InkWell(
              onTap: null,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                    'Receita Arrecadada pelo ${widget.orgaoR} ${real.format(recArrec)} em ${widget.dropdownValueR}'),
                color: Colors.orange[50],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text(''),
              color: Colors.orange[300],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('por mes'),
              color: Colors.orange[400],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Grafico fonte_origem_receita_nome '),
              color: Colors.orange[500],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Grafico 6'),
              color: Colors.orange[600],
            ),
          ],
        ));
  }
}
