//import 'dart:async';
////import 'dart:io';
//import 'package:barcode_scan/barcode_scan.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//import 'package:app_settings/app_settings.dart';
//
//import 'package:testqrcode/Component/SQ.dart';
//
//
//
//
//
//class Scan extends StatefulWidget {
//  @override
//  _ScanState createState() => _ScanState();
//}
//
//class _ScanState extends State<Scan> {
//
//  String _qrcodeUrl;
//
//  String data;
//
//
//  Future scan() async{
//    try{
//      String qrcode = await BarcodeScanner.scan();
//        setState(() {
//          this._qrcodeUrl = qrcode;
//
//        });
//        if(_qrcodeUrl.contains('http://qr.fman.tech')){
//            return showDialog(
//            context: context,
//            builder: (BuildContext context){
//              return new WebviewScaffold(
//              url: '$_qrcodeUrl',
//              withJavascript: true,
//            );
//            }
//          );
//
//        }else{
//          return showDialog(
//            context: context,
//            barrierDismissible: false,
//            builder: (BuildContext context){
//             return AlertDialog(
//               title: new Text('Lỗi'),
//               content: new Text('Không phải QR Code Fman vui lòng thử lại'),
//               actions: <Widget>[
//                 new FlatButton(
//                   child: new Text('Ok'),
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
//                   },
//                 )
//               ],
//             );
//            }
//          );
//        }
//    }on PlatformException catch (e){
//      if (e.code == BarcodeScanner.CameraAccessDenied) {
//        setState(() {
//          return showDialog(
//            context: context,
//            barrierDismissible: false,
//            builder: (BuildContext context){
//              return AlertDialog(
//                title: new Text('Lỗi'),
//                content: new Text('Vui lòng bật máy ảnh'),
//                actions: <Widget>[
//                     FlatButton(
//                       child: new Text('Hủy'),
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder:(context) => Home()));
//                       },
//                     ),
//                     FlatButton(
//                       child: Text('Cài đặt'),
//                       onPressed: (){
//                          AppSettings.openAppSettings();
//                       },//Trường hợp lỡ nhấn lưu và không cấp permission, có thể vào lại setting để cấp permission.
//                     )
//                   ],
//              );
//        }
//      );
//    });
//   }
//    }
//    catch(e){
//      return Navigator.push(context, MaterialPageRoute(builder:(context) => Home()));
//      }
//    }
//
////  Future<String> get _localPath async{
////    final directory = await getApplicationDocumentsDirectory();
////    print(directory.path);
////    return directory.path;
////  }
////
////  Future<File> get _localFile async{
////    final path = await _localPath;
////    return File('$path/data.txt');
////  }
////
////  Future<String> readContent() async{
////    try{
////      final file = await _localFile;
////      String contents = await file.readAsString();
////      return contents;
////    }catch (e){
////      return 'Error';
////    }
////  }
////
////  Future  writeContent() async{
////    final file = await _localFile;
////    return file.writeAsString('$_qrcodeUrl');
////  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    scan();
////    writeContent();
////    readContent().then((String value){
////      setState(() {
////       data = value;
////      });
////    });
//  }
//  @override
//  Widget build(BuildContext context) {
//   /* return Container(
//      child: Scaffold(
//        appBar: AppBar(
//          backgroundColor: Color(getColor('#80C241')),
//          title: Text('Kết quả', style: TextStyle(fontFamily:'Montserrat-SemiBold'),),
//        ),
//        body: GestureDetector(
//            child: Center(
//              child: Container(
//                alignment: Alignment(0.0, 0.0),
//                child: Text(_qrcodeUrl, style: TextStyle(fontFamily:'Montserrat-SemiBold' ,fontSize: 20.0, color:Color(getColor('#0984E3')))),
//              ),
//            ),
//              // event copy text
//            onTap: (){
//              Clipboard.setData(new ClipboardData(text: _qrcodeUrl));
//              showtoast();
//          },
//        )
//      ),
//    );*/
//    return Home();
//  }
//}
