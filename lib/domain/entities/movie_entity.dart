import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backDropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;

  const MovieEntity({
    required this.posterPath,
    required this.id,
    required this.backDropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
  }) : assert(id != null, 'ID must not be null');

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
