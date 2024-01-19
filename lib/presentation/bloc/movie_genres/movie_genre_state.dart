import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/domain/entities/genre_entity.dart';

abstract class MovieGenreState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieGenreInitial extends MovieGenreState {}

class MovieGenreLoading extends MovieGenreState {}

class MovieGenreLoaded extends MovieGenreState {
  final List<GenreEntity> genres;

  MovieGenreLoaded(this.genres);

  @override
  List<Object> get props => [genres];
}

class MovieGenreError extends MovieGenreState {
  final String message;

  MovieGenreError(this.message);

  @override
  List<Object> get props => [message];
}