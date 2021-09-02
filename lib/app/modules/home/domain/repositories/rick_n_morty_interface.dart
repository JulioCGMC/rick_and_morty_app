import 'package:dartz/dartz.dart';
import 'package:rick_n_morty_app/app/core/errors/errors.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/episode.dart';

import '../entities/character.dart';
import '../entities/location.dart';

abstract class IRickNMortyRepository {
  /// Get all characters from the current page with filter options
  Future<Either<Failure,List<Character>>> fetchCharacters({int page = 1, 
    String? name, Status? status, String? species, Gender? gender});
  /// Get a character with the specific id
  Future<Either<Failure,Character>> getCharacter(int id);

  /// Get all locations from the current page with filter options
  Future<Either<Failure,List<Location>>> fetchLocations({int page = 1, 
    String? name, String? dimension});
  /// Get a location with the specific id
  Future<Either<Failure,Location>> getLocation(int id);

  /// Get all episode from the current page with filter options
  Future<Either<Failure,List<Episode>>> fetchEpisodes({int page = 1, 
    String? name, String? episodeCode});
  /// Get a episode with the specific id
  Future<Either<Failure,Episode>> getEpisode(int id);
}