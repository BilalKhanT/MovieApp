import 'movie_model.dart';

class ResultModel {

  List<MovieModel>? movies;

  ResultModel({this.movies,});

  ResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = <MovieModel>[];
      json['results'].forEach((v) {
        movies!.add(MovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.movies != null) {
      data['results'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

