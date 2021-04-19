import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('images/FR_horizontal.png'),
          centerTitle: true,
          toolbarHeight: 80,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('O que é o Fiscaliza Recife?'),
            Text(
              'Este aplicativo tem como objetivo facilitar o acesso ao conteúdo das bases de dados abertos orçamentários da Prefeitura do Recife.',
              //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //textAlign: TextAlign.center),
            ),
            Text(
                'Todos os dados utilizados são fornecidos através da iniciativa de Dados Abertos'),
          ],
        ));
  }
}
