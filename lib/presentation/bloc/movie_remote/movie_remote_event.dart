import 'package:equatable/equatable.dart';

abstract class MovieRemoteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUpcomingMoviesEvent extends MovieRemoteEvent {}