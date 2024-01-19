import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/genre_entity.dart';

import '../entities/app_error.dart';
import '../repos/movie_repo.dart';

class GetGenres {
  final MovieRepository repo;

  GetGenres(this.repo);

  Future<Either<AppError, List<GenreEntity>>> call() async {
    return await repo.getGenres();
  }
}