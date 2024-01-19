import 'package:bloc/bloc.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_search_param.dart';
import 'package:movie_app/domain/usecases/search_movies.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movie_event.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc({required this.searchMovies}) : super(SearchMovieInitial());



  @override
  Stream<SearchMovieState> mapEventToState(SearchMovieEvent event) async* {
    if (event is SearchTermChangedEvent) {
      if (event.searchTerm.length > 2) {
        yield SearchMovieLoading();
        final result = await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));

        yield result.fold(
              (error) => SearchMovieError(error.errorMsg),
              (movies) => SearchMovieLoaded(movies),
        );
      }
    }
  }
}