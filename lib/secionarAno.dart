import 'package:flutter/material.dart';

class SelecionarAno extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SelecionarAno> {
  String dropdownValue = '2021';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 20,
      dropdownColor: Colors.grey,
      isExpanded: true,
      style: TextStyle(color: Colors.blue[900]),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['2021', '2020', '2019', '2018', '2017']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
