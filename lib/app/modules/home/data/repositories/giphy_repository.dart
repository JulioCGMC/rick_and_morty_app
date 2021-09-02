import 'package:dartz/dartz.dart';
import 'package:rick_n_morty_app/app/core/constants/metadata.dart';
import 'package:rick_n_morty_app/app/core/errors/errors.dart';
import 'package:rick_n_morty_app/app/core/network/connectivity_driver.dart';
import 'package:rick_n_morty_app/app/modules/home/data/sources/giphy_api_data_source.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/repositories/giphy_interface.dart';

class GiphyRepository extends IGiphyRepository {
  final ConnectivityDriver _connectivityDriver;
  final GiphyApiDataSource dataSource = GiphyApiDataSource();

  GiphyRepository(this._connectivityDriver);

  @override
  Future<Either<Failure,List<String>>> fetchGifs([int startPoint = 0]) async {
    if (!(await _connectivityDriver.isOnline)) {
      return Left(InternalError(message: Metadata.internetErrorMessage));
    }
    try {
      List<String> gifsUrl = [];
      Map<String,dynamic> response = await dataSource.get(startPoint);
      response['data'].forEach((gif) {
        gifsUrl.add(gif["images"]["fixed_height"]["url"]);
      });
      return Right(gifsUrl);
    } catch (e) {
      print(e);
    }
    return Left(InternalError());
  }
  
}