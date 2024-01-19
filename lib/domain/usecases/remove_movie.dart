import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';
import '../entities/movie_local_entity.dart';
import '../repos/movie_repo.dart';

class RemoveMovie {
  final MovieRepository repo;

  RemoveMovie(this.repo);

  Future<Either<AppError, void>> call(StarredMovieEntity params) async {
    return await repo.deleteMovie(params);
  }
}