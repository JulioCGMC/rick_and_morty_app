import 'package:flutter/material.dart';

class CustomTextTheme extends TextTheme {
  
  const CustomTextTheme({
    TextStyle? headline1,
    TextStyle? headline2,
    TextStyle? headline3 = const TextStyle(color: Colors.white, 
      fontSize: 22, fontWeight: FontWeight.w800),
    TextStyle? headline4 = const TextStyle(color: Colors.white, 
      fontSize: 18, fontWeight: FontWeight.w800),
    TextStyle? headline5 = const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
    TextStyle? headline6 = const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
    TextStyle? subtitle1 = const TextStyle(color: Colors.white70, fontSize: 12),
    TextStyle? subtitle2 = const TextStyle(color: Colors.white70, 
      fontSize: 13,fontStyle: FontStyle.italic),
    TextStyle? bodyText1,
    TextStyle? bodyText2,
    TextStyle? caption,
    TextStyle? button,
    TextStyle? overline
  }) : super(
    headline1: headline1,
    headline2: headline2,
    headline3: headline3,
    headline4: headline4,
    headline5: headline5,
    headline6: headline6,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
    bodyText1: bodyText1,
    bodyText2: bodyText2,
    caption: caption,
    button: button,
    overline: overline
  );
}
