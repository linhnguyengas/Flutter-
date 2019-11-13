import 'package:fluttertoast/fluttertoast.dart';

String _copy = 'Đã copy';

void showtoast(){
  Fluttertoast.showToast(
    msg: _copy,
    toastLength: Toast.LENGTH_LONG
  );
}