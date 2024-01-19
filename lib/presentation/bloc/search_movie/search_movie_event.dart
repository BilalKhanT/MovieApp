import 'package:equatable/equatable.dart';

abstract class SearchMovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchTermChangedEvent extends SearchMovieEvent {
  final String searchTerm;

  SearchTermChangedEvent(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}