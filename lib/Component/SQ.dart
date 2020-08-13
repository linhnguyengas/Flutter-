//import 'info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testqrcode/Color/getColorsHex.dart';
import 'package:testqrcode/Component/LanguageSelectorPage.dart';
import 'scan.dart';
import 'LanguageSelectorPage.dart';
import 'package:testqrcode/Service/ApptTranslations.dart';


import 'package:shared_preferences/shared_preferences.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<bool> _onBack(){
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text(AppTranslations.of(context).text("exit_button_title")),
          actions: <Widget>[
            FlatButton(
              child: Text(AppTranslations.of(context).text("exit_button_ok")),
              onPressed: (){
                SystemNavigator.pop();
              },
            ),
            FlatButton(
              child: Text(AppTranslations.of(context).text("exit_button_cancel")),
              onPressed: ()=>Navigator.pop(context, false),
            )
          ],
        );
      }
    );
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
        appBar: new AppBar(
          title: Text(AppTranslations.of(context).text("tab_home"), style: TextStyle(fontFamily: 'Nunito-SemiBold'),),
          actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LanguageSelectorPage()
                  ));
                },
              ),
            ],
          backgroundColor: Color(getColor('#80C241')),
          automaticallyImplyLeading: false,
          /*actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (contex) => Info()));
              },
            )
          ],*/
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/barcode.png',
              height: 150.0,
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
                child: RaisedButton(
                  onPressed: () => print('Home'),
                  color: Color(getColor('#80C241')),
                  child: Text(AppTranslations.of(context).text("scan_button"), style: TextStyle(color: Color(getColor('#F5F6FA')), fontFamily: 'Nunito-SemiBold', fontSize: 15.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );  
  }
}