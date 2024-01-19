import 'package:movie_app/data/models/movie_local_model.dart';
import 'package:movie_app/domain/entities/genre_entity.dart';
import 'package:movie_app/domain/entities/movie_detial_entity.dart';
import 'package:movie_app/domain/entities/movie_local_entity.dart';
import 'package:movie_app/domain/entities/trailer_entity.dart';

import '../entities/app_error.dart';
import '../entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getUpcoming();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovies(String searchTerm);
  Future<Either<AppError, List<TrailerEntity>>> getTrailers(int id);
  Future<Either<AppError, List<GenreEntity>>> getGenres();
  Future<Either<AppError, void>> saveMovie(StarredMovieEntity starredMovieEntity);
  Future<Either<AppError, List<StarredMovieEntity>>> getSavedMovie();
  Future<Either<AppError, void>> deleteMovie(StarredMovieEntity starredMovieEntity);
}