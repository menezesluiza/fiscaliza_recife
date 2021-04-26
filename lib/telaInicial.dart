import 'dart:ui';
import 'package:flutter/material.dart';
import './drawer.dart';
//import './secionarAno.dart';
import './gridDesp.dart';
import './gridRec.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadOrgaosR();
  }

  String dropdownValueR = '2021';
  List<String> anosR = ['2021', '2020', '2019', '2018', '2017'];

  String dropdownValueD = '2021';
  List<String> anosD = ['2021', '2020', '2019', '2018', '2017'];

  String orgaoR = 'TODOS';
  List<String> orgaosR = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/FR_horizontal.png'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: const Text('Despesas', style: TextStyle(fontSize: 18)),
            ),
            Tab(
              child: const Text('Receitas', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      drawer: Menu(),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            //DESPESAS
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          //padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          decoration:
                              BoxDecoration(color: Colors.lightBlue[50]),
                          height: 50,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownValueD,
                              elevation: 20,
                              dropdownColor: Colors.lightBlue[50],
                              style: TextStyle(color: Colors.blue[900]),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValueD = newValue!;
                                });
                              },
                              items: anosD.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(child: Text(value)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            //padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration:
                                BoxDecoration(color: Colors.lightBlue[50]),
                            height: 50,
                            child: Center(
                              child: Text(
                                'Tipo dado',
                              ),
                            )),
                      )
                    ],
                  ),
                  GridDesp(dropdownValueD: dropdownValueD),
                ],
              ),
            ),
          ),
          Center(
            //RECEITAS
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          //padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          decoration:
                              BoxDecoration(color: Colors.lightBlue[50]),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownValueR,
                              elevation: 20,
                              dropdownColor: Colors.lightBlue[50],
                              style: TextStyle(color: Colors.blue[900]),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValueR = newValue!;
                                });
                              },
                              items: anosR.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(
                                      child: Text(
                                    value,
                                    style: TextStyle(fontSize: 15),
                                  )),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        //BOTAO ORGAOS
                        child: Container(
                          //padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          decoration:
                              BoxDecoration(color: Colors.lightBlue[50]),
                          height: 50,
                          //width: double.maxFinite,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: orgaoR,
                              elevation: 20,
                              isExpanded: true,
                              dropdownColor: Colors.lightBlue[50],
                              style: TextStyle(color: Colors.blue[900]),
                              onChanged: (String? newValue) {
                                setState(() {
                                  orgaoR = newValue!;
                                });
                              },
                              items: orgaosR.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(fontSize: 12)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  GridRec(dropdownValueR: dropdownValueR, orgaoR: orgaoR)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
