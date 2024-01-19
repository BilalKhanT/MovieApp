import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class MovieRemoteState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieRemoteInitial extends MovieRemoteState {}

class MovieRemoteLoading extends MovieRemoteState {}

class MovieRemoteLoaded extends MovieRemoteState {
  final List<MovieEntity> movies;

  MovieRemoteLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieRemoteError extends MovieRemoteState {
  final String message;

  MovieRemoteError(this.message);

  @override
  List<Object> get props => [message];
}