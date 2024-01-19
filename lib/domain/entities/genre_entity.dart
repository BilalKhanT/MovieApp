import 'package:equatable/equatable.dart';

import '../../data/models/movie_detail_model.dart';

class GenreEntity extends Equatable{
  List<Genres> genres;

  GenreEntity({required this.genres});

  @override
  List<Object?> get props => [genres];
}