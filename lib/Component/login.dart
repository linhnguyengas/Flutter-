import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:testqrcode/Color/getColorsHex.dart';
import 'package:testqrcode/Component/LanguageSelectorPage.dart';
import 'package:testqrcode/Component/loginForget.dart';
import 'package:testqrcode/Component/register.dart';
import 'LanguageSelectorPageLogin.dart';
import 'package:testqrcode/Service/ApptTranslations.dart';





class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool check = false;

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
                        decoration: InputDecoration(
                          labelText: AppTranslations.of(context).text('Login_user'),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:30.0, right: 30.0),
                      child: TextFormField(
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
                                  Text(AppTranslations.of(context).text('Login_remember'),)
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  InkWell(
                                    child: Text(AppTranslations.of(context).text('Login_forget'),style: TextStyle(color: Colors.lightBlue),),
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
                      onPressed: ()=>{},
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
                  ],
                ),
              ),
            ),
          ),
        );

  }
}

