import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String title = 'Pokedex';
  static TextStyle getTitleTextStyle() {
    return  TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: _calculateFontSize(48));
  }

   static TextStyle getPokemonNameTextStyle() {
    return  TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: _calculateFontSize(18));
  }
    static TextStyle getPokemonPortraitNameTextStyle() {
    return  TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: _calculateFontSize(24));
  }

     static TextStyle getTypeChipTextStyle() {
    return  TextStyle(
        color: Colors.white, fontSize: _calculateFontSize(18));
  }

  static _calculateFontSize(int size){
    if(ScreenUtil().orientation == Orientation.portrait){
      return size.sp;
    }else{
      return (size*0.75).sp;
    }
  }

  static getPokeInfoLabelTextStyle() {
    return const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  }

  
  static getPokeInfoTextStyle() {
    return const TextStyle(fontSize: 16, color: Colors.black);
  }


}
