import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:testqrcode/LoadingScreen/splash_screen.dart';
import 'package:testqrcode/Component/LanguageSelectorPage.dart';


class CheckSplash extends StatefulWidget {
@override
CheckSplashState createState() => new CheckSplashState();
}

class CheckSplashState extends State<CheckSplash> {
Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => new SplashScreen()));
    } else {
//        prefs.setBool('seen', true);
        Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => new LanguageSelectorPage()));
    }
}

@override
void initState() {
    super.initState();
    new Timer(new Duration(seconds: 0), () {
    checkFirstSeen();
    });
}

@override
Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
        child: Text('Loading...'),
    ),
    );
}
}