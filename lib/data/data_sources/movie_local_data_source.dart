import 'package:movie_app/data/models/movie_local_model.dart';
import 'movie_local/local_database.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(StarredMovieModel movie);
  Future<List<StarredMovieModel>> getSavedMovies();
  Future<void> deleteMovie(StarredMovieModel movie);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {

  final AppDatabase  appDatabase;

  MovieLocalDataSourceImpl(this.appDatabase);

  @override
  Future<void> deleteMovie(StarredMovieModel movie) async {
    await appDatabase.starredMovieDao.deleteStarredMovie(movie);
  }

  @override
  Future<List<StarredMovieModel>> getSavedMovies() {
    return appDatabase.starredMovieDao.getStarredMovies();
  }

  @override
  Future<void> saveMovie(StarredMovieModel movie) async {
    await appDatabase.starredMovieDao.insertStarredMovie(movie);
  }
  
}