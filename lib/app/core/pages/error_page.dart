import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  final Widget? button;

  const ErrorPage(this.message,this.button);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).errorColor.withOpacity(0.6),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          ),
          child: SizedBox(
            height: 0.5,
            width: 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/img/logo.png",
                      fit: BoxFit.fill,
                      width: 180,
                      height: 180,
                    ),
                    SizedBox(height: 40),
                    Text("Erro ⚠️", 
                      style: Theme.of(context).textTheme.headline5!.apply(
                        color: Theme.of(context).accentColor)
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(message, textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    button == null ? ElevatedButton(
                      child: Text("Recarregar", 
                        style: TextStyle(color: Colors.white)),
                      onPressed: () 
                        => Modular.to.pushNamedAndRemoveUntil("/",
                          ModalRoute.withName("/")),
                    ) : button!
                  ]
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}