import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/movie_local_entity.dart';
import 'package:movie_app/domain/repos/movie_repo.dart';

import '../entities/app_error.dart';

class GetSavedMovie {
  final MovieRepository repo;

  GetSavedMovie(this.repo);

  Future<Either<AppError, List<StarredMovieEntity>>> call() async {
    return await repo.getSavedMovie();
  }
}