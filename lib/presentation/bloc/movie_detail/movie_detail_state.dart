import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/app_error.dart';

import '../../../domain/entities/movie_detial_entity.dart';

abstract class MovieDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movieDetailEntity;

  MovieDetailLoaded(this.movieDetailEntity);

  @override
  List<Object> get props => [movieDetailEntity];
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError(this.message);

  @override
  List<Object> get props => [message];
}