import 'package:asuka/asuka.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_n_morty_app/app/core/errors/errors.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/repositories/giphy_interface.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/home_controller.dart';

part 'gifs_controller.g.dart';

class GifsController = GifsControllerBase with _$GifsController;

abstract class GifsControllerBase with Store {
  final IGiphyRepository _repository;
  final HomeController baseController;

  GifsControllerBase(this._repository, this.baseController) {
    if (gifs.length == 0) {
      addGifs();
    }
  }

  @computed
  ObservableList<String> get gifs => baseController.gifs;

  @action Future<void> addGifs() async {
    Either<Failure, List<String>> result = await _repository.fetchGifs(gifs.length+1);
    result.fold(
      (failure) => AsukaSnackbar.alert(failure.message).show(), 
      (r) => gifs.addAll(r)
    );
  }
}