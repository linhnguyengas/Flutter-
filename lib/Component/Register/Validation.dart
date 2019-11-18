
class Validation{


  static String validateSupplierName(String value){
    if (!(value.length >3)&& value.isNotEmpty){
      return('Tên nhà phân phối phải có ít nhất 3 kí tự');
    }
    if(value.isEmpty){
      return('Bạn không được để trống phần này');
    }
    return null;
  }

  static String validateUserName(String value){
    if (!(value.length >3)&& value.isNotEmpty){
      return('Tên nhà phân phối phải có ít nhất 2 kí tự');
    }
    if(value.isEmpty){
      return('Bạn không được để trống phần này');
    }
    return null;
  }

  static String validatePassword(String value){
    if (!(value.length >8)&& value.isNotEmpty){
      return('Mật khẩu phải có ít nhất 8 kí tự');
    }if(value.isEmpty){
      return('Bạn không được để trống phần này');
    }
    return null;
  }

  static String validateRePassword(String repwd, String pwd){
    if (!(repwd.length >8)&& repwd.isNotEmpty){
      return('Mật khẩu phải có ít nhất 8 kí tự');
    }else if(repwd  != pwd){
      return('Xác nhận mật khẩu không chính xác');
    }
    if(repwd.isEmpty){
      return('Bạn không được để trống phần này');
    }
    return null;
  }

  static String validateEmail(String value){
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if(value.isEmpty){
      return('Bạn không được để trống phần này');
    }else if (!regExp.hasMatch(value)){
      return('Hãy nhập Email hợp lệ');
    }
    return null;
  }

  static String validatePhone(String value){
    if(value.isEmpty){
      return('Bạn không được để trống phần này');
    } else if(value.length < 10 || value.length > 11){
      return('Số điện thoại không hợp lệ');
    }
    return null;
  }

  static String validateAddress(String value){
    if(value.isEmpty){
      return('Bạn không được để trống phần này');
    }
    return null;
  }
}
