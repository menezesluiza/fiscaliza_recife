import 'package:flutter/material.dart';

class Receita with ChangeNotifier {
  int anoRec;
  int mes;
  String mesNome;
  //String orgaoCodigo;
  String orgaoNome;
  //String unidadeCodigo;
  double receitaPrevista;
  double receitaArrecadada;

  //String unidade_nome;
  /*String fonte_recurso_codigo;
  String fonte_recurso_nome;
  String categoria_receita_codigo;
  double categoria_receita_nome;
  String fonte_origem_receita_codigo;
      String fonte_origem_receita_nome;
  String subfonte_receita_codigo;
  String subfonte_receita_nome;*/

  Receita({
    required this.anoRec,
    required this.mes,
    required this.mesNome,
    //required this.orgaoCodigo,
    required this.orgaoNome,
    //required this.unidadeCodigo,
    required this.receitaPrevista,
    required this.receitaArrecadada,
  });
}

/*
  List<Receita> _receitas = [];
  double _totalRecArrec = 0;

  Uri _url = Uri.parse(
      'https://fiscaliza-recife-default-rtdb.firebaseio.com/dados/receitas/2021.json');

  //Uri _urldetele = Uri.parse(
  //   'https://fiscaliza-recife-default-rtdb.firebaseio.com/receitas/2021.json');

  Future<List> loadData() async {
    final response = await http.get(_url);
    //http.delete(_urldetele);
    List<dynamic> _datalist = json.decode(response.body);
    _datalist.clear();
    _receitas.clear();
    _datalist.forEach((element) {
      element.forEach((key, value) {
        String _rArrec = element['receita_arrecadada'];
        String _rPrev = element['receita_prevista'];
        _receitas.add(Receita(
          anoRec: element['ano'],
          mes: element['mes'],
          mesNome: element['mes_nome'],
          orgaoNome: element['orgao_nome'],
          receitaArrecadada:
              double.parse(_rArrec.substring(0, _rArrec.length - 2)),
          receitaPrevista: double.parse(_rPrev.substring(0, _rPrev.length - 2)),
        ));
      });
    });

    setState(() {
      _receitas.forEach((element) {
        _totalRecArrec += element.receitaArrecadada;
      });
    });

    //print(_receitas[0].receitaPrevista);
    return _receitas;
  }*/
