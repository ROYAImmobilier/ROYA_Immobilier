

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenSized {

  static double IconFiltter(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
     // print("ttt"+ screenWidth.toString());
      return 30;
    }else if( screenWidth>800){
      return 30;
    }
    else {
      return 20;
    }
  }

  static double PaddingFavoris(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      //print("ttt"+ screenWidth.toString());
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
  static double Detalistheight(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      //print("ttt"+ screenWidth.toString());
      return 135;
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
      return 270;
    }else if( screenWidth>800){
      return 200;
    }
    else {
      return 240;
    }
  } static double PaddingUserName(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      //print("ttt"+ screenWidth.toString());
      return 130;
    }else if( screenWidth>800){
      return 70;
    }
    else {
      return 65;
    }
  }
  static double CardSized(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      //print("ttt"+ screenWidth.toString());
      return 350;
    }else if( screenWidth>800){
      return 250;
    }
    else {
      return 350;
    }
  }  static double ProfileImage(double screenWidth,double screenheight ){
    if( screenWidth < 385 && screenheight<600){
      //print("ttt"+ screenWidth.toString());
      return 100;
    }else if( screenWidth>800){
      return 90;
    }
    else {
      return 70;
    }
  }

}