import '../../domain/entities/genre_entity.dart';
import 'movie_detail_model.dart';

class GenreModel extends GenreEntity {
  List<Genres> genres;

  GenreModel({required this.genres}) : super(genres: genres);

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      genres: _genres(json),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    return data;
  }
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
