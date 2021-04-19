import 'package:flutter/material.dart';

class Receita with ChangeNotifier {
  String anoRec;
  String mes;
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
