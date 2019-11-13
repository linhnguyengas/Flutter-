import 'package:flutter/material.dart';
import 'package:testqrcode/Color/getColorsHex.dart';
class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About'),
        backgroundColor: Color(getColor('#80C241')),
      ),
    );
  }
}