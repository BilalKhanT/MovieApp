import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/genre_model.dart';
import 'package:movie_app/data/models/movie_local_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/trailer_model.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_local_entity.dart';
import 'package:movie_app/domain/repos/movie_repo.dart';

import '../data_sources/movie_local/local_database.dart';
import '../data_sources/movie_local_data_source.dart';
import '../models/movie_detail_model.dart';

class MovieRepositoryImplementation extends MovieRepository {
  final MovieRemoteDataSource dataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImplementation(this.dataSource, this.localDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getUpcoming() async {
    try {
      final movies = await dataSource.getUpcoming();
      return Right(movies);
    } on SocketException {
      return Left(AppError('Please check your network connection'));
    }
    on Exception {
      return Left(AppError('Oops, something went wrong'));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async {
    try {
      final movies = await dataSource.getMovieDetail(id);
      return Right(movies);
    } on SocketException {
      return Left(AppError('Please check your network connection'));
    }
    on Exception {
      return Left(AppError('Oops, something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getSearchedMovies(String searchTerm) async {
    try {
      final movies = await dataSource.getSearchedMovies(searchTerm);
      return Right(movies);
    } on SocketException {
      return Left(AppError('Please check your network connection'));
    }
    on Exception {
      return Left(AppError('Oops, something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<TrailerModel>>> getTrailers(int id) async {
    try {
      final videos = await dataSource.getVideo(id);
      return Right(videos);
    } on SocketException {
      return Left(AppError('Please check your network connection'));
    }
    on Exception {
      return Left(AppError('Oops, something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<GenreModel>>> getGenres() async {
    try {
      final genres = await dataSource.getGenres();
      return Right(genres);
    } on SocketException {
      return Left(AppError('Please check your network connection'));
    }
    on Exception {
      return Left(AppError('Oops, something went wrong'));
    }
  }

  @override
  Future<Either<AppError, void>> deleteMovie(StarredMovieEntity starredMovieEntity) async {
    try {
      final movie = await localDataSource.deleteMovie(StarredMovieModel.fromEntity(starredMovieEntity));
      return Right(movie);
    }
    on Exception {
      return Left(AppError('Oops, something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<StarredMovieEntity>>> getSavedMovie() async {
    try {
      final models = await localDataSource.getSavedMovies();
      final movies = models.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on Exception {
      return Left(AppError('Oops, something went wrong'));
    }
  }

  @override
  Future<Either<AppError, void>> saveMovie(StarredMovieEntity starredMovieEntity) async {
    try {
      final movie = await localDataSource.saveMovie(StarredMovieModel.fromEntity(starredMovieEntity));
      return Right(movie);
    }
    on Exception {
      return Left(AppError('Oops, something went wrong'));
    }
  }

}
