import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_n_morty_app/app/core/constants/apis.dart';

class RickNMortyApiDataSource {
  final Dio _dio = Modular.get<Dio>();
  RickNMortyApiDataSource() {
    _dio.interceptors.add(DioCacheManager(
      CacheConfig(defaultMaxAge: Apis.cacheDuration)).interceptor);
  }

  Future<Map<String,dynamic>?> characters({String? filter, int? id}) async {
    Response response = await _dio.get("${Apis.characters}${id ?? filter ?? ''}");
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

  Future<Map<String,dynamic>?> locations({String? filter, int? id}) async {
    Response response = await _dio.get("${Apis.locations}${id ?? filter ?? ''}");
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  Future<Map<String,dynamic>?> episodes({String? filter, int? id}) async {
    Response response = await _dio.get("${Apis.episodes}${id ?? filter ?? ''}");
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }
}