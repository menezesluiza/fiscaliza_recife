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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'O QUE É O FISCALIZA RECIFE?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Este aplicativo tem como objetivo facilitar o acesso ao conteúdo das bases de dados abertos orçamentários da Prefeitura do Recife.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                    'Todos os dados utilizados são fornecidos através da iniciativa de Dados Abertos.',
                    style: TextStyle(
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ));
  }
}
