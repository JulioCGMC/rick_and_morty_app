import 'package:flutter/material.dart';

class CustomTextTheme {
  // final MaterialColor swatch = 
  static LightTextTheme light = LightTextTheme();
  static DarkTextTheme dark = DarkTextTheme();

  static TextTheme get currentTheme {
    return light;
  }
}

class LightTextTheme extends TextTheme {

  const LightTextTheme({
    headline3 = const TextStyle(color: Colors.black, 
      fontSize: 22, fontWeight: FontWeight.w800),
    headline4 = const TextStyle(color: Colors.black, 
      fontSize: 18, fontWeight: FontWeight.w800),
    headline5 = const TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
    headline6 = const TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
    subtitle1 = const TextStyle(color: Colors.black45, fontSize: 12),
    subtitle2 = const TextStyle(color: Colors.black45, 
      fontSize: 13,fontStyle: FontStyle.italic)
  }) : super(headline3: headline3,
    headline4: headline4, headline5: headline5, headline6: headline6,
    subtitle1: subtitle1, subtitle2: subtitle2
  );
}

class DarkTextTheme extends TextTheme {

  const DarkTextTheme({
    headline3 = const TextStyle(color: Colors.white, 
      fontSize: 22, fontWeight: FontWeight.w800),
    headline4 = const TextStyle(color: Colors.white, 
      fontSize: 18, fontWeight: FontWeight.w800),
    headline5 = const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
    headline6 = const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
    subtitle1 = const TextStyle(color: Colors.white70, fontSize: 12),
    subtitle2 = const TextStyle(color: Colors.white70, 
      fontSize: 13,fontStyle: FontStyle.italic)
  }) : super(headline3: headline3,
    headline4: headline4, headline5: headline5, headline6: headline6,
    subtitle1: subtitle1, subtitle2: subtitle2
  );
}
