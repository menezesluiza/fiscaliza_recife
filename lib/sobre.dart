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
      body: Center(
        child: Text('Sobre o app'),
      ),
    );
  }
}
