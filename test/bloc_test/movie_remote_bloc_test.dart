import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/usecases/get_upcoming.dart';
import 'package:movie_app/presentation/bloc/movie_remote/movie_remote_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_remote/movie_remote_event.dart';
import 'package:movie_app/presentation/bloc/movie_remote/movie_remote_state.dart';

class MockGetUpcoming extends Mock implements GetUpcoming {}

main() {
   late MockGetUpcoming mockGetUpcoming;
   late MovieRemoteBloc movieRemoteBloc;

  setUp(() {
    mockGetUpcoming = MockGetUpcoming();
    movieRemoteBloc = MovieRemoteBloc(getUpcoming: mockGetUpcoming);
  });

  tearDown(() {
    movieRemoteBloc.close();
  });

  test('initial state is [MovieRemoteInitial]', () {
    expect(movieRemoteBloc.state.runtimeType, MovieRemoteInitial);
  });

  blocTest<MovieRemoteBloc, MovieRemoteState>(
    'emits [MovieRemoteLoading, MovieRemoteLoaded] when fetching data success',
    build: () {
      when(mockGetUpcoming.call()).thenAnswer((_) async => Right(<MovieEntity>[]));
      return movieRemoteBloc;
    },
    act: (bloc) => bloc.add(GetUpcomingMoviesEvent()),
    expect: () => [
      MovieRemoteLoading(),
      MovieRemoteLoaded(<MovieEntity>[]),
    ],
  );

  blocTest<MovieRemoteBloc, MovieRemoteState>(
    'emits [MovieRemoteLoading, MovieRemoteError] when fetching data fails',
    build: () {
      when(mockGetUpcoming.call()).thenAnswer((_) async => Left(AppError('error')));
      return movieRemoteBloc;
    },
    act: (MovieRemoteBloc bloc) =>
      bloc.add(GetUpcomingMoviesEvent()),
    expect: () => [
      MovieRemoteLoading(),
      MovieRemoteError('error'),
    ],
  );
}
