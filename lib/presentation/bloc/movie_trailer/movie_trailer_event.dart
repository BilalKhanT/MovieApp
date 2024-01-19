import 'package:equatable/equatable.dart';

abstract class MovieTrailerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetMovieTrailerEvent extends MovieTrailerEvent {
  final int movieId;

  GetMovieTrailerEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}