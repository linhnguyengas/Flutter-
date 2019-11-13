import 'package:flutter/material.dart';
import 'package:testqrcode/Component/login.dart';
import 'package:testqrcode/Service/ApptTranslations.dart';

class LoginForget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          padding: EdgeInsets.all(30.0),
          color: Colors.green,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white
            ),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20.0),),
                Image.asset('assets/logo/logo2.png'),
                Padding(
                  padding: const EdgeInsets.only(left:40.0, right: 40.0,top: 30.0),
                  child: Text(AppTranslations.of(context).text('Title_send_mail'),
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                SizedBox(height: 50.0,),
                Container(
                  padding: const EdgeInsets.only(left:30.0, right: 30.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email'
                    ),
                  ),
                ),
                SizedBox(height: 50.0,),
                RaisedButton(
                  onPressed: ()=>{},
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text(AppTranslations.of(context).text('Send_mail_button'),
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(height: 50.0,),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(AppTranslations.of(context).text('Comeback')),
                      SizedBox(width: 5.0,),
                      InkWell(
                        child: Text(AppTranslations.of(context).text('Home_page'),style: TextStyle(color: Colors.lightBlue)),
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));},
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
