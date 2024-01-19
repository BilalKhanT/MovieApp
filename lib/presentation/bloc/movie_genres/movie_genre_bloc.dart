import 'package:bloc/bloc.dart';
import 'package:movie_app/domain/usecases/get_genres.dart';

import 'movie_genre_event.dart';
import 'movie_genre_state.dart';

class MovieGenreBloc extends Bloc<MovieGenreEvent, MovieGenreState> {
  final GetGenres getGenres;

  MovieGenreBloc({required this.getGenres}) : super(MovieGenreInitial());



  @override
  Stream<MovieGenreState> mapEventToState(MovieGenreEvent event) async* {
    if (event is GetGenresEvent) {
      yield MovieGenreLoading();
      final result = await getGenres();

      yield result.fold(
            (error) => MovieGenreError(error.errorMsg),
            (movies) => MovieGenreLoaded(movies),
      );
    }
  }
}