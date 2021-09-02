import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage() {
    Future.delayed(Duration(seconds: 2), 
      () => Modular.to.navigate("/home", replaceAll: true));
  }

  @override
  Widget build(BuildContext context) {
    /// TODO: Add rick and morty fun gif
    return Material(
      child: Center(
        child: TweenAnimationBuilder<double>(
          curve: Curves.bounceOut,
          duration: Duration(milliseconds: 1600),
          tween: Tween<double>(begin: 2, end: 0),
          builder: (BuildContext context, double tween, Widget? child) => Align(
            alignment: Alignment(tween,0),  
            child: Container(
              height: 0.3.sw,
              child: child
            ),
          ),
        )
      ),
    );
  }
}
