import 'package:asuka/asuka.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_n_morty_app/app/core/errors/errors.dart';
import 'package:rick_n_morty_app/app/core/functions/functions.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/episode.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/repositories/rick_n_morty_interface.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/home_controller.dart';

part 'episodes_controller.g.dart';

class EpisodesController = EpisodesControllerBase with _$EpisodesController;

abstract class EpisodesControllerBase with Store {
  final IRickNMortyRepository _repository;
  final HomeController baseController;

  EpisodesControllerBase(this._repository, this.baseController) {
    if (episodes.length == 0) {
      addEpisodes();
    }
  }

  @computed
  ObservableList<Episode> get episodes => baseController.episodes;

  Future<void> showEpisode(Episode episode) async {
    Modular.to.pushNamed("/home/episode", arguments: episode);
  }

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

  @action Future<void> addEpisodes() async {
    int currentPage = 0;
    // Each page has 20 items
    currentPage += ((episodes.length-1) ~/ 20);
    
    Either<Failure, List<Episode>> result = await _repository.fetchEpisodes(
      page: currentPage+1);
    result.fold(
      (failure) => AsukaSnackbar.alert(failure.message).show(), 
      (r) => episodes.addAll(r)
    );
  }
}