import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_n_morty_app/app/core/constants/apis.dart';

class GiphyApiDataSource {
  final Dio _dio = Modular.get<Dio>();
  
  Future<Map<String,dynamic>> get([int offset = 0]) async {
    String url = "${Apis.giphyUrl}&api_key=${Apis.giphyKey}";
    url += "&q=rick%20and%20morty&limit=20&rating=G&offset=$offset";
    Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    }
    else if (response.data != null) {
      throw response.data;
    }
    else {
      throw response.statusMessage ?? response.statusCode ?? response.toString();
    }
  }
}