import 'package:flutter/material.dart';

class SelecionarAno extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SelecionarAno> {
  //AnoSelecionado anoInicial = new AnoSelecionado.ano('2021');
  //

  //AnoSelecionado.ano(valor)
  //
  String dropdownValue = '2021';
  List<String> anos = ['2021', '2020', '2019', '2018', '2017'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 20,
      dropdownColor: Colors.lightBlue[50],
      style: TextStyle(color: Colors.blue[900]),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          print(dropdownValue);
        });
      },
      items: anos.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(child: Text(value)),
        );
      }).toList(),
    );
  }
}

class AnoSelecionado {
  String ano = '2021';

  AnoSelecionado.ano(String valor);

  // String get anoBotao => this.ano;

  // set anoBotao(String ano) => ano = this.ano;
}
