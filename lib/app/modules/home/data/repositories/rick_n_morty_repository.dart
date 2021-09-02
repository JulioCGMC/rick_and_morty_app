import 'package:enum_to_string/enum_to_string.dart';
import 'package:rick_n_morty_app/app/core/constants/metadata.dart';
import 'package:rick_n_morty_app/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:rick_n_morty_app/app/core/network/connectivity_driver.dart';
import 'package:rick_n_morty_app/app/modules/home/data/entities/character_model.dart';
import 'package:rick_n_morty_app/app/modules/home/data/entities/episode_model.dart';
import 'package:rick_n_morty_app/app/modules/home/data/entities/location_model.dart';
import 'package:rick_n_morty_app/app/modules/home/data/sources/rick_n_morty_api_data_source.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/repositories/rick_n_morty_interface.dart';

class RickNMortyRepository extends IRickNMortyRepository {
  final ConnectivityDriver _connectivityDriver;
  final RickNMortyApiDataSource dataSource = RickNMortyApiDataSource();

  RickNMortyRepository(this._connectivityDriver);

  @override
  Future<Either<Failure, List<CharacterModel>>> fetchCharacters({int page = 1, 
  String? name, Status? status, String? species, Gender? gender}) async {
    /// Convert filters
    List<String> filter = [];
    if (page > 1) { filter.add("?page=$page"); }
    if (name != null) { filter.add("name=$name"); }
    if (status != null) { filter.add("status=$status"); }
    if (species != null) { 
      filter.add("species="+EnumToString.convertToString(species)); }
    if (gender != null) {
      filter.add("gender="+EnumToString.convertToString(gender)); }
    filter.removeWhere((e) => e.isEmpty);

    try {
      Map<String,dynamic>? data = await dataSource.characters(filter: filter.join('&'));
      if (data != null && data['results'] != null && data['results'] is List) {
        List<CharacterModel> models = [];
        data['results'].forEach((e) => models.add(CharacterModel.fromJson(e)));
        
        return Right(models);
      }
    } catch (e) {
      print(e);
      if (!(await _connectivityDriver.isOnline)) {
        return Left(InternalError(message: Metadata.internetErrorMessage));
      }
    }
    return Left(InternalError());
  }

  @override
  Future<Either<Failure, List<EpisodeModel>>> fetchEpisodes({int page = 1, 
  String? name, String? episodeCode}) async {
    /// Convert filters
    List<String> filter = [];
    if (page > 1) { filter.add("?page=$page"); }
    if (name != null) { filter.add("name=$name"); }
    if (episodeCode != null) { filter.add("episode=$episodeCode"); }
    filter.removeWhere((e) => e.isEmpty);

    try {
      Map<String,dynamic>? data = await dataSource.episodes(filter: filter.join('&'));
      print(data != null);
      print(data?['results'] != null);
      print(data?['results']! is List);
      if (data != null && data['results'] != null && data['results']! is List) {
        List<EpisodeModel> models = [];
        data['results'].forEach((e) => models.add(EpisodeModel.fromJson(e)));
        
        return Right(models);
      }
    } catch (e) {
      print(e);
      if (!(await _connectivityDriver.isOnline)) {
        return Left(InternalError(message: "Sem conexão! por favor, verifique sua conexão e tente novamente"));
      }
    }
    return Left(InternalError(message: "Erro! por favor, tente novamente mais tarde"));
  }

  @override
  Future<Either<Failure, List<LocationModel>>> fetchLocations({int page = 1, 
  String? name, String? dimension}) async {
    /// Convert filters
    List<String> filter = [];
    if (page > 1) { filter.add("?page=$page"); }
    if (name != null) { filter.add("name=$name"); }
    if (dimension != null) { filter.add("dimension=$dimension"); }
    filter.removeWhere((e) => e.isEmpty);

    try {
      Map<String,dynamic>? data = await dataSource.locations(filter: filter.join('&'));
      if (data != null && data['results'] != null && data['results'] is List) {
        List<LocationModel> models = [];
        data['results'].forEach((e) => models.add(LocationModel.fromJson(e)));
        
        return Right(models);
      }
    } catch (e) {
      print(e);
      if (!(await _connectivityDriver.isOnline)) {
        return Left(InternalError(message: "Sem conexão! por favor, verifique sua conexão e tente novamente"));
      }
    }
    return Left(InternalError(message: "Erro! por favor, tente novamente mais tarde"));
  }

  @override
  Future<Either<Failure, CharacterModel>> getCharacter(int id) async {
    try {
      Map<String,dynamic>? data = await dataSource.characters(id: id);
      if (data != null) {
        return Right(CharacterModel.fromJson(data));
      }
    } catch (e) {
      print(e);
      if (!(await _connectivityDriver.isOnline)) {
        return Left(InternalError(message: "Sem conexão! por favor, verifique sua conexão e tente novamente"));
      }
    }
    return Left(InternalError(message: "Erro! por favor, tente novamente mais tarde"));
  }

  @override
  Future<Either<Failure, EpisodeModel>> getEpisode(int id) async {
    try {
      Map<String,dynamic>? data = await dataSource.episodes(id: id);
      if (data != null) {
        return Right(EpisodeModel.fromJson(data));
      }
    } catch (e) {
      print(e);
      if (!(await _connectivityDriver.isOnline)) {
        return Left(InternalError(message: "Sem conexão! por favor, verifique sua conexão e tente novamente"));
      }
    }
    return Left(InternalError(message: "Erro! por favor, tente novamente mais tarde"));
  }

  @override
  Future<Either<Failure, LocationModel>> getLocation(int id) async {
    try {
      Map<String,dynamic>? data = await dataSource.locations(id: id);
      if (data != null) {
        return Right(LocationModel.fromJson(data));
      }
    } catch (e) {
      print(e);
      if (!(await _connectivityDriver.isOnline)) {
        return Left(InternalError(message: "Sem conexão! por favor, verifique sua conexão e tente novamente"));
      }
    }
    return Left(InternalError(message: "Erro! por favor, tente novamente mais tarde"));
  }
  
}