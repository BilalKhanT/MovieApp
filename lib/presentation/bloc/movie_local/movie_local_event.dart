import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_local_entity.dart';

abstract class MovieLocalEvent extends Equatable {
  const MovieLocalEvent();
}

class LoadSavedMovieEvent extends MovieLocalEvent {
  @override
  List<Object> get props => [];
}

class DeleteSavedMovieEvent extends MovieLocalEvent {
  final StarredMovieEntity starredMovieEntity;

  DeleteSavedMovieEvent(this.starredMovieEntity);

  @override
  List<Object> get props => [starredMovieEntity];

}

class SaveMovieEvent extends MovieLocalEvent {
  final StarredMovieEntity starredMovieEntity;

  SaveMovieEvent(this.starredMovieEntity);

  @override
  List<Object> get props => [starredMovieEntity];
}