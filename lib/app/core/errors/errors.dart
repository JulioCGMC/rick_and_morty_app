abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  final String message;
  ConnectionError({this.message = "Erro ao conectar-se à internet"});
}

class InternalError implements Failure {
  final String message;
  InternalError({this.message = "Erro interno"});
}
