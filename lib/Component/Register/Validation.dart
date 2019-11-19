import 'package:flutter/material.dart';
import 'package:testqrcode/Component/LanguageSelectorPage.dart';
import 'package:testqrcode/Service/ApptTranslations.dart';



class Validation{
  
  static bool checkValidSupplierName = false;
  static bool checkValidUserName = false;
  static bool checkValidPassword = false;
  static bool checkValidRePassword = false;
  static bool checkValidEmai = false;
  static bool checkValidPhone = false;
  static bool checkValidAndress = false;


  static String validateSupplierName(String value, BuildContext context){
    if (!(value.length >3)&& value.isNotEmpty){
      return(AppTranslations.of(context).text('Suplier_valid').toString());
    }
    if(value.isEmpty){
      return(AppTranslations.of(context).text('Regiter_empty_valid').toString());
    }
    checkValidSupplierName = true;
    return null;
  }

  static String validateUserName(String value, BuildContext context){
    if (!(value.length >3)&& value.isNotEmpty){
      return(AppTranslations.of(context).text('User_valid').toString());
    }
    if(value.isEmpty){
      return(AppTranslations.of(context).text('Regiter_empty_valid').toString());
    }
    checkValidUserName = true;
    return null;
  }

  static String validatePassword(String value, BuildContext context){
    if (!(value.length >8)&& value.isNotEmpty){
      return(AppTranslations.of(context).text('Pw_valid').toString());
    }if(value.isEmpty){
      return(AppTranslations.of(context).text('Regiter_empty_valid').toString());
    }
    checkValidPassword = true;
    return null;
  }

  static String validateRePassword(String repwd, String pwd, BuildContext context){
    if (!(repwd.length >8)&& repwd.isNotEmpty){
      return(AppTranslations.of(context).text('Pw_valid').toString());
    }else if(repwd  != pwd){
      return(AppTranslations.of(context).text('Rpw_valid').toString());
    }
    if(repwd.isEmpty){
      return(AppTranslations.of(context).text('Regiter_empty_valid').toString());
    }
    checkValidRePassword = true;
    return null;
  }

  static String validateEmail(String value, BuildContext context){
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if(value.isEmpty){
      return(AppTranslations.of(context).text('Regiter_empty_valid').toString());
    }else if (!regExp.hasMatch(value)){
      return(AppTranslations.of(context).text('Email_valid').toString());
    }
    checkValidEmai = true;
    return null;
  }

  static String validatePhone(String value, BuildContext context){
    if(value.isEmpty){
      return(AppTranslations.of(context).text('Regiter_empty_valid').toString());
    } else if(value.length < 10 || value.length > 11){
      return(AppTranslations.of(context).text('Phone_valid').toString());
    }
    checkValidPhone = true;
    return null;
  }

  static String validateAddress(String value, BuildContext context){
    if(value.isEmpty){
      return(AppTranslations.of(context).text('Regiter_empty_valid').toString());
    }
    checkValidAndress = true;
    return null;
  }
}
