import 'package:movie_app/data/core/api_dio.dart';
import 'package:movie_app/data/models/genre_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/result_model.dart';
import 'package:movie_app/data/models/trailer_model.dart';
import 'package:movie_app/data/models/trailer_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getUpcoming();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<MovieModel>> getSearchedMovies(String searchTerm);
  Future<List<TrailerModel>> getVideo(int id);
  Future<List<GenreModel>> getGenres();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiDio _dio;

  MovieRemoteDataSourceImpl(this._dio);

  @override
  Future<List<MovieModel>> getUpcoming() async {
    final resp = await _dio.get();
    final movies = ResultModel.fromJson(resp).movies;
    return movies ?? [];
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final resp = await _dio.getDetails(id);
    final movies = MovieDetailModel.fromJson(resp);
    return movies;
  }

  @override
  Future<List<MovieModel>> getSearchedMovies(String searchTerm) async {
    final resp = await _dio.getSearch(searchTerm);
    final movies = ResultModel.fromJson(resp).movies;
    return movies ?? [];
  }

  @override
  Future<List<TrailerModel>> getVideo(int id) async {
    final resp = await _dio.getVideo(id);
    final videos = TrailerResultModel.fromJson(resp).results;
    return videos ?? [];
  }

  @override
  Future<List<GenreModel>> getGenres() async {
    final resp = await _dio.getGenres();
    final genresList = _genres(resp);
    return genresList.map((genre) => GenreModel(genres: [genre])).toList();
  }

  List<Genres> _genres(Map<String, dynamic> json) {
    List<Genres> genresList = [];
    if (json['genres'] != null) {
      json['genres'].forEach((v) {
        genresList.add(Genres.fromJson(v));
      });
    }
    return genresList;
  }

}
