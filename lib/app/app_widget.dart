import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/custom_text_theme.dart';
import 'core/constants/default_style.dart';
import 'core/constants/metadata.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: Metadata.appName,
        theme: ThemeData.from(
          colorScheme: DefaultStyle.light, 
          textTheme: CustomTextTheme()
        ),
        darkTheme: ThemeData.from(
          colorScheme: DefaultStyle.dark,
          textTheme: CustomTextTheme()
        ),
        initialRoute: '/',
        builder: asuka.builder,
        navigatorObservers: [
          // if u don`t add this Hero will not work
          asuka.asukaHeroController
        ],
      ).modular()
    );
  }
}