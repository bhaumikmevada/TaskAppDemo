
import 'package:flutter/material.dart';

class AppText{


  static const String roboto = "Roboto";
  


  static Widget TextRegular(String text,double fontSize,Color fontColor,{TextAlign textAlign = TextAlign.left,int maxLine = 1}){
    return Text(text,style: TextStyle(fontFamily: roboto,fontWeight: FontWeight.w400,fontSize: fontSize,color: fontColor),
      textAlign: textAlign);
  }


  static Widget TextMedium(String text,double fontSize,Color fontColor,{TextAlign textAlign = TextAlign.left,int maxLine = 1}){
    return Text(text,style: TextStyle(fontFamily: roboto,fontWeight: FontWeight.w500,fontSize: fontSize,color: fontColor),
      textAlign: textAlign);
  }

  static Widget TextSemiBold(String text,double fontSize,Color fontColor,{TextAlign textAlign = TextAlign.left,int maxLine = 1}){
    return Text(text,style: TextStyle(fontFamily: roboto,fontWeight: FontWeight.w600,fontSize: fontSize,color: fontColor),);
  }

  static Widget TextBold(String text,double fontSize,Color fontColor,{TextAlign textAlign = TextAlign.left,int maxLine = 1}){
    return Text(text,style: TextStyle(fontFamily: roboto,fontWeight: FontWeight.w700,fontSize: fontSize,color: fontColor),
      textAlign: textAlign,);
  }


}