import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';

class MovieDetailEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backDropPath;
  final String title;
  final String releaseDate;
  final List<Genres> genreIds;
  final String overview;

  const MovieDetailEntity({
    required this.posterPath,
    required this.id,
    required this.backDropPath,
    required this.title,
    required this.genreIds,
    required this.releaseDate,
    required this.overview,
  });

  @override
  List<Object> get props => [id];
}
