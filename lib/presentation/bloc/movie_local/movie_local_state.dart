import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_local_entity.dart';

abstract class MovieLocalState extends Equatable {

  const MovieLocalState();

  @override
  List<Object> get props => [];
}

class MovieLocalInitial extends MovieLocalState {}

class MovieLocalLoaded extends MovieLocalState {
  final List<StarredMovieEntity> movies;

  MovieLocalLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieLocalError extends MovieLocalState {
  final String message;

  MovieLocalError(this.message);

  @override
  List<Object> get props => [message];
}