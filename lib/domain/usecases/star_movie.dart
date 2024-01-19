import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_local_entity.dart';
import 'package:movie_app/domain/repos/movie_repo.dart';

class SaveMovie {
  final MovieRepository repo;

  SaveMovie(this.repo);

  Future<Either<AppError, void>> call(StarredMovieEntity params) async {
    return await repo.saveMovie(params);
  }
}