import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ'),
      ),
      body: Text('test'),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
