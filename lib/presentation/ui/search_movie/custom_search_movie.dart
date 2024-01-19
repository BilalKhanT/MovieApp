import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/bloc/movie_genres/movie_genre_event.dart';
import 'package:movie_app/presentation/bloc/movie_genres/movie_genre_state.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movie_bloc.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movie_event.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movie_state.dart';
import 'package:movie_app/presentation/ui/search_movie/search_movie_card.dart';
import 'package:movie_app/presentation/widgets/categories_tile.dart';

import '../../bloc/movie_genres/movie_genre_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieBloc searchMovieBloc;
  final MovieGenreBloc movieGenreBloc;

  CustomSearchDelegate(this.searchMovieBloc, this.movieGenreBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: query.isEmpty ? null : () => query = '',
        icon: Icon(Icons.close),
        color: Colors.black54,
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.search_outlined),
      color: Colors.black54,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(
      SearchTermChangedEvent(query),
    );

    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
        bloc: searchMovieBloc,
        builder: (context, state) {
          if (state is SearchMovieLoaded) {
            final movies = state.movies;
            if (movies.isEmpty) {
              return Center(
                child: Text('Please try again later',
                  style: GoogleFonts.poppins(
                    color: Colors.grey.shade900,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
              );
            }
            return ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => SearchMovieCard(movie: movies[index]),
            );
          }
          else if (state is SearchMovieError) {
            return Center(
              child: Text('Please try again later',
              style: GoogleFonts.poppins(
                color: Colors.grey.shade900,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            );
          }
          else{
            return SizedBox.shrink();
          }
        },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    movieGenreBloc.add(
      GetGenresEvent(),
    );

    return BlocBuilder<MovieGenreBloc, MovieGenreState>(
      bloc: movieGenreBloc,
      builder: (context, state) {
        if (state is MovieGenreLoaded) {
          return categoriesTile(context, state.genres);
        }
        else if (state is MovieGenreError) {
          return Center(
            child: Text('Ops, something went wrong',
              style: GoogleFonts.poppins(
                color: Colors.grey.shade900,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
          );
        }
        else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
