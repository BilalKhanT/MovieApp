import 'package:equatable/equatable.dart';

abstract class MovieGenreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetGenresEvent extends MovieGenreEvent {}