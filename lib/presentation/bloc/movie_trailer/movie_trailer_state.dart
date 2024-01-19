import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/trailer_entity.dart';

abstract class MovieTrailerState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieTrailerInitial extends MovieTrailerState {}

class MovieTrailerLoading extends MovieTrailerState {}

class MovieTrailerLoaded extends MovieTrailerState {
  final List<TrailerEntity> trailers;

  MovieTrailerLoaded(this.trailers);

  @override
  List<Object> get props => [trailers];
}

class MovieTrailerError extends MovieTrailerState {
  final String message;

  MovieTrailerError(this.message);

  @override
  List<Object> get props => [message];
}