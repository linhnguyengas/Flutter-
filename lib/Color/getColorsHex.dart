int getColor(String colors){
     colors = "FF" + colors;
     colors = colors.replaceAll("#", "");
     int val = 0 ; 
     int len = colors.length;
     for (int i = 0; i < len; i++) {
       int hexDigit = colors.codeUnitAt(i);
       if(hexDigit >= 48 && hexDigit <= 57){
         val += (hexDigit - 48) * (1 <<(4 * (len - 1 - i)));
       }
       else if(hexDigit >= 65 && hexDigit <= 70){
         val += (hexDigit - 55) * (1 <<(4 * (len - 1 -i )));
       }
       else if(hexDigit >= 97 && hexDigit <= 70){
         val += (hexDigit - 87) * (1 <<(4 * (len - 1 -i )));
       }
       else{
         throw new FormatException("An Error");
       }
     }
     return val ;
   }