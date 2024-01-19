import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/data/core/api_dio.dart';
import 'package:movie_app/data/data_sources/movie_local/local_database.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/repos/movie_repo_impl.dart';
import 'package:movie_app/domain/repos/movie_repo.dart';
import 'package:movie_app/domain/usecases/get_genres.dart';
import 'package:movie_app/domain/usecases/get_star_movie.dart';
import 'package:movie_app/domain/usecases/get_trailer.dart';
import 'package:movie_app/domain/usecases/remove_movie.dart';
import 'package:movie_app/domain/usecases/search_movies.dart';
import 'package:movie_app/presentation/bloc/movie_genres/movie_genre_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_local/movie_local_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_trailer/movie_trailer_bloc.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movie_bloc.dart';
import '../data/data_sources/movie_local_data_source.dart';
import '../domain/usecases/get_movie_detial.dart';
import '../domain/usecases/get_upcoming.dart';
import '../domain/usecases/star_movie.dart';
import '../presentation/bloc/movie_detail/movie_detail_bloc.dart';
import '../presentation/bloc/movie_remote/movie_remote_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  final db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  getItInstance.registerSingleton<AppDatabase>(db);
  getItInstance.registerLazySingleton<Dio>(() => Dio());
  getItInstance.registerLazySingleton<ApiDio>(() => ApiDio(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl(getItInstance<AppDatabase>()));
  getItInstance.registerLazySingleton<GetUpcoming>(() => GetUpcoming(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(getItInstance()));
  getItInstance.registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));
  getItInstance.registerLazySingleton<GetTrailer>(() => GetTrailer(getItInstance()));
  getItInstance.registerLazySingleton(() => GetGenres(getItInstance()));
  getItInstance.registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()));
  getItInstance.registerLazySingleton<RemoveMovie>(() => RemoveMovie(getItInstance()));
  getItInstance.registerLazySingleton<GetSavedMovie>(() => GetSavedMovie(getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImplementation(getItInstance(), getItInstance()));
  getItInstance.registerFactory(() => MovieRemoteBloc(getUpcoming: getItInstance()));
  getItInstance.registerFactory(() => MovieDetailBloc(getMovieDetail: getItInstance(), movieTrailerBloc: getItInstance(), movieLocalBloc: getItInstance()));
  getItInstance.registerFactory(() => SearchMovieBloc(searchMovies: getItInstance()));
  getItInstance.registerFactory(() => MovieTrailerBloc(getTrailer: getItInstance()));
  getItInstance.registerFactory(() => MovieGenreBloc(getGenres: getItInstance()));
  getItInstance.registerFactory(() => MovieLocalBloc(saveMovie: getItInstance(), removeMovie: getItInstance(), getSavedMovie: getItInstance()));
}