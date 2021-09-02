import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/components/loading_dialog.dart';
import 'core/constants/apis.dart';
import 'core/network/connectivity_driver.dart';
import 'core/pages/splash_page.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ConnectivityDriver()),
    $LoadingDialogImpl,
    Bind((i) => Dio(BaseOptions(baseUrl: Apis.baseUrl, headers: Apis.headers)))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => SplashScreenPage()),
    ModuleRoute("/home", module: HomeModule()),
  ];

}