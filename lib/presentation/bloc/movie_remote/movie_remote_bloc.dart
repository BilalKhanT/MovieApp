import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:movie_app/domain/usecases/get_upcoming.dart';
import 'movie_remote_event.dart';
import 'movie_remote_state.dart';

class MovieRemoteBloc extends Bloc<MovieRemoteEvent, MovieRemoteState> {
  final GetUpcoming getUpcoming;

  MovieRemoteBloc({required this.getUpcoming}) : super(MovieRemoteInitial());



  @override
  Stream<MovieRemoteState> mapEventToState(MovieRemoteEvent event) async* {
    if (event is GetUpcomingMoviesEvent) {
      yield MovieRemoteLoading();
      final result = await getUpcoming();

      yield result.fold(
            (error) => MovieRemoteError(error.errorMsg),
            (movies) => MovieRemoteLoaded(movies),
      );
    }
  }
}