import 'package:bloc/bloc.dart';
import 'package:movie_app/domain/usecases/get_star_movie.dart';
import 'package:movie_app/domain/usecases/remove_movie.dart';
import 'package:movie_app/domain/usecases/star_movie.dart';
import 'package:movie_app/presentation/bloc/movie_local/movie_local_event.dart';
import 'package:movie_app/presentation/bloc/movie_local/movie_local_state.dart';

class MovieLocalBloc extends Bloc<MovieLocalEvent, MovieLocalState> {
  final SaveMovie saveMovie;
  final RemoveMovie removeMovie;
  final GetSavedMovie getSavedMovie;

  MovieLocalBloc({
    required this.saveMovie,
    required this.removeMovie,
    required this.getSavedMovie,
  }) : super(MovieLocalInitial());

  @override
  Stream<MovieLocalState> mapEventToState(MovieLocalEvent event) async* {
    if (event is SaveMovieEvent) {
      await saveMovie(event.starredMovieEntity);
    }
    else if (event is LoadSavedMovieEvent) {
      final result = await getSavedMovie();

      yield result.fold(
            (error) => MovieLocalError(error.errorMsg),
            (movies) => MovieLocalLoaded(movies),
      );
    }
    else if (event is DeleteSavedMovieEvent) {
      await removeMovie(event.starredMovieEntity);
      final updatedMoviesResult = await getSavedMovie();
      yield updatedMoviesResult.fold(
            (error) => MovieLocalError(error.errorMsg),
            (movies) => MovieLocalLoaded(movies),
      );
    }
  }
}
