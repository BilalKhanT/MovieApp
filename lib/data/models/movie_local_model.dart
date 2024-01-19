import 'package:floor/floor.dart';
import 'package:movie_app/domain/entities/movie_local_entity.dart';

@Entity(tableName: 'starred_movies')
class StarredMovieModel {
  @primaryKey
  final int id;

  final String title;
  final String posterPath;
  final String releaseDate;

  StarredMovieModel({required this.id, required this.title, required this.posterPath, required this.releaseDate});

  factory StarredMovieModel.fromEntity(StarredMovieEntity entity) {
    return StarredMovieModel(
      id: entity.id,
      title: entity.title,
      posterPath: entity.posterPath,
      releaseDate: entity.releaseDate,
    );
  }

  StarredMovieEntity toEntity() {
    return StarredMovieEntity(id, title, posterPath, releaseDate);
  }
}