import 'package:asuka/asuka.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_n_morty_app/app/core/errors/errors.dart';
import 'package:rick_n_morty_app/app/core/functions/functions.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/repositories/rick_n_morty_interface.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/home_controller.dart';

part 'characters_controller.g.dart';

class CharactersController = CharactersControllerBase with _$CharactersController;

abstract class CharactersControllerBase with Store {
  final IRickNMortyRepository _repository;
  final HomeController baseController;

  CharactersControllerBase(this._repository, this.baseController) {
    if (characters.length == 0) {
      addCharacters();
    }
  }

  @computed
  ObservableList<Character> get characters => baseController.characters;

  Future<Character?> getRandomFeaturedCharacter(List<String> charactersUrl) async {
    Character? char;
    if (charactersUrl.length > 0) {
      String url = charactersUrl.elementAt(randomBetween(charactersUrl.length));
      int? id = int.tryParse(url.split('/').last);
      if (id != null) {
        Either<Failure,Character> response = await _repository.getCharacter(id);
        response.fold(
          (l) => print(l.message),
          (r) => char = r
        );
      }
    }
    return char;
  }

  @action Future<void> addCharacters() async {
    int currentPage = 0;
    // Each page has 20 items
    currentPage += ((characters.length-1) ~/ 20);
    
    Either<Failure, List<Character>> result = await _repository.fetchCharacters(
      page: currentPage+1);
    result.fold(
      (failure) => AsukaSnackbar.alert(failure.message).show(), 
      (r) => characters.addAll(r)
    );
  }
}