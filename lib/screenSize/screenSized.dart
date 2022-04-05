
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

  static double PaddingFavoris(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      print("ttt"+ screenWidth.toString());
      return 10;
    }else if( screenWidth>800){
      return 5;
    }
    else {
      return 5;
    }
  }

  static double Avatar(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      //print("ttt"+ screenWidth.toString());
      return 20;
    }else if( screenWidth>800){
      return 40;
    }
    else {
      return 30;
    }
  }
  static double Detalisheight(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      //print("ttt"+ screenWidth.toString());
      return 125;
    }else if( screenWidth>800){
      return 85;
    }
    else {
      return 95;
    }
  }

  static double PaddingPost(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      //print("ttt"+ screenWidth.toString());
      return 230;
    }else if( screenWidth>800){
      return 150;
    }
    else {
      return 250;
    }
  } static double PaddingUserName(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      //print("ttt"+ screenWidth.toString());
      return 125;
    }else if( screenWidth>800){
      return 85;
    }
    else {
      return 65;
    }
  }

}