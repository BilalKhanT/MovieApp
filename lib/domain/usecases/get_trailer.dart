import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/trailer_entity.dart';
import 'package:movie_app/domain/repos/movie_repo.dart';

import '../entities/app_error.dart';
import '../entities/movie_params.dart';

class GetTrailer {
  final MovieRepository repo;

  GetTrailer(this.repo);

  Future<Either<AppError, List<TrailerEntity>>> call(MovieParams movieParams) async {
    return await repo.getTrailers(movieParams.id);
  }
}