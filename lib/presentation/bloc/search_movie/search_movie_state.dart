import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class SearchMovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieLoaded extends SearchMovieState {
  final List<MovieEntity> movies;

  SearchMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchMovieError extends SearchMovieState {
  final String message;

  SearchMovieError(this.message);

  @override
  List<Object> get props => [message];
}