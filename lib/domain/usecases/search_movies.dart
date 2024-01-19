import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/movie_search_param.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import '../repos/movie_repo.dart';

class SearchMovies {
  final MovieRepository repo;

  SearchMovies(this.repo);

  Future<Either<AppError, List<MovieEntity>>> call(MovieSearchParams params) async {
    return await repo.getSearchedMovies(params.searchTerm);
  }
}