import 'package:floor/floor.dart';
import '../../../models/movie_local_model.dart';

@dao
abstract class StarredMovieDao {
  @Query('SELECT * FROM starred_movies')
  Future<List<StarredMovieModel>> getStarredMovies();

  @Query('SELECT * FROM starred_movies WHERE id = :id')
  Stream<StarredMovieModel?> getStarredMovieById(int id);

  @insert
  Future<void> insertStarredMovie(StarredMovieModel movie);

  @delete
  Future<void> deleteStarredMovie(StarredMovieModel movie);
}