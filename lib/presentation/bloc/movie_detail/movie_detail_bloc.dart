import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/presentation/bloc/movie_local/movie_local_event.dart';
import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/movie_detial_entity.dart';
import '../../../domain/entities/movie_params.dart';
import '../../../domain/usecases/get_movie_detial.dart';
import '../movie_local/movie_local_bloc.dart';
import '../movie_trailer/movie_trailer_bloc.dart';
import '../movie_trailer/movie_trailer_event.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final MovieTrailerBloc movieTrailerBloc;
  final MovieLocalBloc movieLocalBloc;

  MovieDetailBloc( {
    required this.movieTrailerBloc,
    required this.getMovieDetail,
    required this.movieLocalBloc,
  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
      MovieDetailEvent event,
      ) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntity> result =
      await getMovieDetail(
        MovieParams(event.movieId),
      );

      yield result.fold(
            (error) => MovieDetailError(error.errorMsg),
            (movies) => MovieDetailLoaded(movies),
      );

      movieTrailerBloc.add(GetMovieTrailerEvent(event.movieId));
    }
  }
}