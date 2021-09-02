import 'package:dartz/dartz.dart';
import 'package:rick_n_morty_app/app/core/errors/errors.dart';

abstract class IGiphyRepository {
  Future<Either<Failure,List<String>>> fetchGifs([int startPoint = 0]);
}