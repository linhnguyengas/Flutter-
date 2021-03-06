import 'dart:ffi';

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:testqrcode/Component/login.dart';
import 'package:testqrcode/Service/ApptTranslations.dart';
import 'package:testqrcode/Component/Register/Validation.dart';




class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController supplierNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController rePwController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> _key = new GlobalKey();
  String supplierName, username, password, rePassword, email, phone, address;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Material(
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.green,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white
                ),
                child: Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20.0),),
                      Image.asset('assets/logo/logo2.png'),
                      Padding(
                        padding: const EdgeInsets.only(left:40.0, right: 40.0,top: 30.0),
                        child: Text(AppTranslations.of(context).text('Title_register'),
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      SizedBox(height: 50.0,),
                      Container(
                        padding: const EdgeInsets.only(left:30.0, right: 30.0),
                        child: TextFormField(
                          controller: supplierNameController,
                          validator: (String val){
                            String sName = supplierNameController.text;
                            return Validation.validateSupplierName(sName, context);
                          },
                          onSaved: (String val){
                            supplierName = val;
                          },
                          decoration: InputDecoration(
                              labelText: AppTranslations.of(context).text('Supplier_name')
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:30.0, right: 30.0),
                        child: TextFormField(
                          controller: userNameController,
                          validator: (String val){
                            String uName = userNameController.text;
                            return Validation.validateUserName(uName, context);
                          },
                          onSaved: (String val){
                            username = val;
                          },
                          decoration: InputDecoration(
                              labelText: AppTranslations.of(context).text('User_name')
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:30.0, right: 30.0),
                        child: TextFormField(
                          controller: pwController,
                          obscureText: true,
                          validator: (String val){
                            String pw = pwController.text;
                            return Validation.validatePassword(pw, context);
                          },
                          onSaved: (String val){
                            password = val;
                          },
                          decoration: InputDecoration(
                              labelText: AppTranslations.of(context).text('Password'),

                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:30.0, right: 30.0),
                        child:  TextFormField(
                          controller: rePwController,
                          obscureText: true,
                          validator: (String val) {
                            String pwd = pwController.text;
                            String repwd = rePwController.text;
                            return Validation.validateRePassword(repwd, pwd, context);
                          },
                          onSaved: (String val){
                            rePassword = val;
                          },
                          decoration: InputDecoration(
                              labelText: AppTranslations.of(context).text('Re_password'),

                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:30.0, right: 30.0),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String val){
                            String email = emailController.text;
                            return Validation.validateEmail(email, context);
                          },
                          onSaved: (String val){
                            email = val;
                          },
                          decoration: InputDecoration(
                              labelText: AppTranslations.of(context).text('Email')
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:30.0, right: 30.0),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          validator: (String val){
                            String phone = phoneController.text;
                            return Validation.validatePhone(phone, context);
                          },
                          onSaved: (String val){
                            phone = val;
                          },
                          decoration: InputDecoration(
                              labelText: AppTranslations.of(context).text('Phone')
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:30.0, right: 30.0),
                        child: TextFormField(
                          controller: addressController,
                          validator: (String val){
                            String andress = addressController.text;
                            return Validation.validateAddress(andress, context);
                          },
                          onSaved: (String val){
                            address = val;
                          },
                          decoration: InputDecoration(
                              labelText: AppTranslations.of(context).text('Address')
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      RaisedButton(
                        onPressed: ()=> {
                          fectchPost(supplierNameController.text,
                            userNameController.text,
                            pwController.text,
                            emailController.text,
                            phoneController.text,
                            addressController.text)
                          ,
                            if(_key.currentState.validate()){
                              _key.currentState.save()
                            }
                        },
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(AppTranslations.of(context).text('Register_button'),
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.only(bottom:20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(AppTranslations.of(context).text('Comeback')),
                            SizedBox(width: 5.0,),
                            InkWell(
                              child: Text(AppTranslations.of(context).text('Home_page'),style: TextStyle(color: Colors.lightBlue)),
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));},
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],

      ),
    );
  }

  Future fectchPost(String Sname, String Uname, String pwd,String email,String phone, String address) async{
    var body = jsonEncode({
      "username": Uname,
      "password" : pwd,
      "name": Sname,
      "phone": phone ,
      "email" : email,
      "location": address,
    });

    final response = await http.post('https://fman.tech/api/distributor/register',body: body);
    

    /*if(userNameController.text.isEmpty ||
        supplierNameController.text.isEmpty ||
        pwController.text.isEmpty ||
        rePwController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty)
      return;*/
    if(!(Validation.checkValidAndress &&
        Validation.checkValidSupplierName &&
        Validation.checkValidUserName &&
        Validation.checkValidPassword &&
        Validation.checkValidRePassword &&
        Validation.checkValidEmai &&
        Validation.checkValidPhone))
      return;
    else if (response.statusCode >= 200 && response.statusCode < 400){
      log('ok');
      showDialogRegisterSuccess();
    }else{
      log('error');
      showDialogRegisterFail();
    }
  }


  void showDialogRegisterSuccess(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(AppTranslations.of(context).text('Register_dialog_success')),
            content: Text(AppTranslations.of(context).text('Register_dialog_success_content')),
            actions: <Widget>[
              FlatButton(
                child: Text(AppTranslations.of(context).text('Register_dialog_comback_home_button')),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                },
              )
            ],
          );
        }
    );
  }

  void showDialogRegisterFail(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(AppTranslations.of(context).text('Register_dialog_fall')),
            content: Text(AppTranslations.of(context).text('Register_dialog_fall_content')),
            actions: <Widget>[
              FlatButton(
                child: Text(AppTranslations.of(context).text('Register_dialog_reType_button')),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
}
