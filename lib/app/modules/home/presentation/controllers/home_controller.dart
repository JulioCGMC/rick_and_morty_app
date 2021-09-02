import 'package:asuka/asuka.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_n_morty_app/app/core/errors/errors.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/episode.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/location.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/repositories/rick_n_morty_interface.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final IRickNMortyRepository _repository;
  HomeControllerBase(this._repository);

  @observable
  ObservableList<Episode> episodes = <Episode>[].asObservable();
  @observable
  ObservableList<Location> locations = <Location>[].asObservable();
  @observable
  ObservableList<Character> characters = <Character>[].asObservable();
  @observable
  ObservableList<String> gifs = <String>[].asObservable();

  // @computed
  // Stream<Episode> getEpisodes() {}

  @action Future<void> addLocations() async {
    int currentPage = 1;
    // Each page has 20 items
    currentPage += ((locations.length-1) ~/ 20);
    
    Either<Failure, List<Location>> result = await _repository.fetchLocations(
      page: currentPage+0);
    result.fold(
      (failure) => AsukaSnackbar.alert(failure.message).show(), 
      (r) => locations.addAll(r)
    );
  }
}