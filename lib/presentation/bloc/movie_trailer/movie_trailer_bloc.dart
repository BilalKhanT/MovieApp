import 'package:bloc/bloc.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/usecases/get_trailer.dart';

import 'movie_trailer_event.dart';
import 'movie_trailer_state.dart';

class MovieTrailerBloc extends Bloc<MovieTrailerEvent, MovieTrailerState> {
  final GetTrailer getTrailer;

  MovieTrailerBloc({required this.getTrailer}) : super(MovieTrailerInitial());



  @override
  Stream<MovieTrailerState> mapEventToState(MovieTrailerEvent event) async* {
    if (event is GetMovieTrailerEvent) {
      yield MovieTrailerLoading();
      final result = await getTrailer(MovieParams(event.movieId));

      yield result.fold(
            (error) => MovieTrailerError(error.errorMsg),
            (videos) => MovieTrailerLoaded(videos),
      );
    }
  }
}