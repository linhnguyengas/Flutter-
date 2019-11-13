import 'package:flutter/material.dart';
import 'package:testqrcode/Component/login.dart';
import 'package:testqrcode/Component/loginForget.dart';
import 'package:testqrcode/Component/register.dart';

import 'package:testqrcode/Service/AppTranslationsDelegate.dart';
import 'LoadingScreen/checkSplash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:testqrcode/Service/Application.dart';
import 'package:shared_preferences/shared_preferences.dart';



//import 'LoadingScreen/intro.dart';

void main() =>
  runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AppTranslationsDelegate _newLocaleDelegate;

  Future initLanguageCode() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('languageCode') ?? 'vn';
    print(languageCode);
    application.onLocaleChanged = onLocaleChange;
    application.onLocaleChanged(Locale(languageCode));
  }


  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
   initLanguageCode();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      localizationsDelegates: [
        _newLocaleDelegate,
        const AppTranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales(),
    );
  }

  void onLocaleChange(Locale locale){
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });

  }

}

