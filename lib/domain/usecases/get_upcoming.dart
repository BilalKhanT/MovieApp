import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repos/movie_repo.dart';

import '../entities/app_error.dart';

class GetUpcoming {
  final MovieRepository repo;

  GetUpcoming(this.repo);

  Future<Either<AppError, List<MovieEntity>>> call() async {
    return await repo.getUpcoming();
  }
}