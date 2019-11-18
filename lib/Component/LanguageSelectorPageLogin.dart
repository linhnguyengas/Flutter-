import 'package:flutter/material.dart';
import 'package:testqrcode/Component/login.dart';
import 'package:testqrcode/Service/Application.dart';
import 'package:testqrcode/Service/ApptTranslations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testqrcode/LoadingScreen/intro.dart';
import 'home.dart';

/*giong y chang con di~ LanguageSeletorPage, qua luoi viet lai goi ngon ngu cho page login nen copy paste!*/
class LanguageSelectorPageLogin extends StatefulWidget {
  @override
  _LanguageSelectorPageStateLogin createState() => _LanguageSelectorPageStateLogin();
}

class _LanguageSelectorPageStateLogin extends State<LanguageSelectorPageLogin> {

  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList = application.supportedLanguagesCodes;

  final Map<dynamic,dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
    languagesList[2]: languageCodesList[2],
  };



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF80C241),
        title: Text(
          AppTranslations.of(context).text("title_select_language"),
        ),
      ),
      body: _buildLanguagesList(),
    );
  }

  _buildLanguagesList(){
    return ListView.builder(
      itemCount: languagesList.length,
      itemBuilder: (context, index){
       return _buildLanguageItem(languagesList[index]);
      },
    );
  }

  _buildLanguageItem(String language){
    return InkWell(
      onTap: () async{
          setLanguageCode(language);
          application.onLocaleChanged(Locale(languagesMap[language]));


          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool _seen = (prefs.getBool('seen') ?? false);

        if (_seen)
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Login()));
        else {
          prefs.setBool('seen', true);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Login()));
        }
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            language,
            style: TextStyle(
              fontSize: 24.0
            ),
          ),
        ),
      ),
    );
  }


  Future setLanguageCode(language) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languagesMap[language]);
    print(languagesMap[language]);
  }

}
