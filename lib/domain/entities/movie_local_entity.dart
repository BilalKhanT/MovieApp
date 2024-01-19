import 'package:equatable/equatable.dart';

class StarredMovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;

  StarredMovieEntity(this.id, this.title, this.posterPath, this.releaseDate);

  @override
  List<Object?> get props => [id];
}