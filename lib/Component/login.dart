import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:testqrcode/Color/getColorsHex.dart';
import 'package:testqrcode/Component/LanguageSelectorPage.dart';
import 'package:testqrcode/Component/home.dart';
import 'package:testqrcode/Component/loginForget.dart';
import 'package:testqrcode/Component/register.dart';
import 'LanguageSelectorPageLogin.dart';
import 'package:testqrcode/Service/ApptTranslations.dart';


// ignore: missing_return


class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool check = false;

  GlobalKey<FormState> _key = new GlobalKey();
  String password;
  // ignore: missing_return
  String validatePassword(String value){
    if (!(value.length >= 8) && value.isNotEmpty){
      return ('Mật khẩu phải có ít nhất 8 kí tự');
    }else if(value.isEmpty){
      return ('Bạn không được để trống phần này');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Material(
            child: Container(

              color: Colors.green,
              padding: EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20.0),),
                      Image.asset('assets/logo/logo2.png', height: 100,),
                      Text(AppTranslations.of(context).text('Login_title'),
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito-SemiBold',
                            fontSize: 25.0),
                      ),

                            Container(

                            padding: EdgeInsets.only(left:30.0, right: 30.0),
                            child: TextFormField(
                              controller: usernameController,

                              decoration: InputDecoration(
                                labelText: AppTranslations.of(context).text('Login_user'),
                              ),
                            ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left:30.0, right: 30.0),
                              child: TextFormField(
                                controller: pwController,
                                validator: validatePassword,
                                onSaved: (String val){
                                  password = val;
                                },
                                decoration: InputDecoration(
                                  labelText: AppTranslations.of(context).text('Login_pwd'),
                                ),
                              ),
                            ),




                      Padding(
                        padding: const EdgeInsets.only(left:8.0, right: 26.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: check,
                                      onChanged: null,
                                    ),
                                    Text(AppTranslations.of(context).text('Login_remember'),
                                      style: TextStyle(fontSize: 12.0),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    InkWell(
                                      child: Text(AppTranslations.of(context).text('Login_forget'),style: TextStyle(color: Colors.lightBlue, fontSize: 12.0),),
                                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginForget()));},
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      RaisedButton(
                        onPressed:()=> {
                          fectchPost(usernameController.text, pwController.text),
                          if(_key.currentState.validate()){
                            _key.currentState.save(),
                          }
                        },
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(AppTranslations.of(context).text('Login_button'),
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Text(AppTranslations.of(context).text('Login_text_select'),
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: ()=>{},
                                    color: Color(getColor('#3B5998')),
                                    textColor: Colors.white,
                                    child: Text('Facebook',style: TextStyle(fontSize: 15.0),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 15.0,),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: ()=>{},
                                    color: Color(getColor('#E93F2E')),
                                    textColor: Colors.white,
                                    child: Text('Google',style: TextStyle(fontSize: 15.0),),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(AppTranslations.of(context).text('Login_text_register'),
                            style: TextStyle(color: Colors.black54),
                          ),
                          InkWell(
                              child: Text(AppTranslations.of(context).text('Login_register')),
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));},
                          )
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      RaisedButton(
                        onPressed: () =>{Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageSelectorPageLogin()))},
                        child: Text(AppTranslations.of(context).text("title_select_language")),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

  }
  Future fectchPost(String username , String password) async{
    var body = jsonEncode({
      "username" : username,
      "password": password
    });
    final response = await http.post('https://fman.tech/api/distributor/login',body: body);
    log(username.toString());
    log(password.toString());
    int i = response.statusCode;

    if (response.statusCode >= 200 || response.statusCode < 400){
      log('ok');
      log(i.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      // làm thêm chuyển hướng về home và hiển thị thông báo thành công.
    }else{
      log('error');
      log(i.toString());
      // làm thông báo lỗi.
    }
  }
}

