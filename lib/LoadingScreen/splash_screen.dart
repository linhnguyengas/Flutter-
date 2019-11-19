import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testqrcode/Component/SQ.dart';
import 'package:testqrcode/Color/getColorsHex.dart';
import 'package:testqrcode/LoadingScreen/colorLoader.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // after loading => go to home scan
    Timer(Duration(seconds: 4), () => Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => new Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(getColor('#FFFFFF'))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Image.asset('assets/logo/logoScan.jpg',
                        height:150.0,
                        fit: BoxFit.cover,
                        ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Fman Scan',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito-SemiBold',
                            fontSize: 25.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ColorLoader(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    /*Text(
                      'Fman Scan',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                          color: Colors.white),
                    )*/
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
