import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/movie_detial_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';

import '../entities/app_error.dart';
import '../repos/movie_repo.dart';

class GetMovieDetail {
  final MovieRepository repo;

  GetMovieDetail(this.repo);

  Future<Either<AppError, MovieDetailEntity>> call(MovieParams movieParams) async {
    return await repo.getMovieDetail(movieParams.id);
  }
}