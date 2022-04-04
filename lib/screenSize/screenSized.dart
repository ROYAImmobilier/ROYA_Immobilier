
import 'package:flutter/cupertino.dart';

class ScreenSized {

  static double IconFiltter(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      print("ttt"+ screenWidth.toString());
      return 50;
    }else if( screenWidth>800){
      return 30;
    }
    else {
      return 20;
    }
  }

}