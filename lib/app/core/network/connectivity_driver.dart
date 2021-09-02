import 'package:flutter_modular/flutter_modular.dart';

import '../functions/functions.dart';
import 'connectivity_interface.dart';

@Injectable(singleton: false)
class ConnectivityDriver implements IConnectivityDriver {
  @override
  Future<bool> get isOnline async => hasConnection();
}
