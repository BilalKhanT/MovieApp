import 'package:movie_app/domain/entities/movie_detial_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  final bool adult;
  final String backdropPath;
  final int budget;
  final List<Genres> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;

  MovieDetailModel(
      {required this.adult,
      required this.backdropPath,
      required this.budget,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.imdbId,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.revenue,
      required this.runtime,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount})
      : super(
          posterPath: posterPath,
          id: id,
          backDropPath: backdropPath,
          genreIds: genres,
          title: title,
          releaseDate: releaseDate,
          overview: overview,
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      budget: json['budget'],
      genres: _genres(json),
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['budget'] = this.budget;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
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

class BelongsToCollection {
  int id;
  String name;
  String posterPath;
  String backdropPath;

  BelongsToCollection(
      {required this.id,
      required this.name,
      required this.posterPath,
      required this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    return data;
  }
}

class Genres {
  int id;
  String name;

  Genres({required this.id, required this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      id : json['id'],
      name : json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProductionCompanies {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompanies({required this.id, required this.logoPath, required this.name, required this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) {
    return ProductionCompanies(
      id : json['id'],
      logoPath : json['logo_path'],
      name : json['name'],
      originCountry : json['origin_country'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries({required this.iso31661, required this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) {
    return ProductionCountries(
      iso31661 : json['iso_3166_1'],
      name : json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
}

class SpokenLanguages {
  String iso6391;
  String name;

  SpokenLanguages({required this.iso6391, required this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) {
    return SpokenLanguages(
      iso6391 : json['iso_639_1'],
      name : json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}
