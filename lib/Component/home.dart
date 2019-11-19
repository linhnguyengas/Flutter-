import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('test', style: TextStyle(fontSize: 30.0),),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 40.0,
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: ()=>{},
                child: Icon(Icons.shopping_cart, size: 25.0,),
              ),
              InkWell(
                onTap: ()=>{},
                child:Icon(Icons.home, size: 25.0,) ,
              ),
              InkWell(
                onTap: ()=>{},
                child: Icon(Icons.supervised_user_circle, size: 25.0,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
