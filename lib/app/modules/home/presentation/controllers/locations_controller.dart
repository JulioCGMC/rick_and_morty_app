import 'package:asuka/asuka.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_n_morty_app/app/core/errors/errors.dart';
import 'package:rick_n_morty_app/app/core/functions/functions.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/location.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/repositories/rick_n_morty_interface.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/home_controller.dart';

part 'locations_controller.g.dart';

class LocationsController = LocationsControllerBase with _$LocationsController;

abstract class LocationsControllerBase with Store {
  final IRickNMortyRepository _repository;
  final HomeController baseController;

  LocationsControllerBase(this._repository, this.baseController) {
    if (locations.length == 0) {
      addLocations();
    }
  }

  @computed
  ObservableList<Location> get locations => baseController.locations;

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

  @action Future<void> addLocations() async {
    int currentPage = 0;
    // Each page has 20 items
    currentPage += ((locations.length-1) ~/ 20);
    
    Either<Failure, List<Location>> result = await _repository.fetchLocations(
      page: currentPage+1);
    result.fold(
      (failure) => AsukaSnackbar.alert(failure.message).show(), 
      (r) => locations.addAll(r)
    );
  }
}