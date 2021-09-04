import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_n_morty_app/app/core/errors/errors.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/repositories/rick_n_morty_interface.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/home_controller.dart';

part 'episode_controller.g.dart';

class EpisodeController = EpisodeControllerBase with _$EpisodeController;

abstract class EpisodeControllerBase with Store {
  final IRickNMortyRepository _repository;
  final HomeController baseController;

  EpisodeControllerBase(this._repository, this.baseController);

  Future<Character?> getFeaturedCharacter(String characterUrl) async {
    Character? char;
    int? id = int.tryParse(characterUrl.split('/').last);

    if (id != null) {
      Either<Failure,Character> response = await _repository.getCharacter(id);
      response.fold(
        (l) => print(l.message),
        (r) => char = r
      );
    }
    return char;
  }
}