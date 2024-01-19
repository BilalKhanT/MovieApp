import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/ui/movie_detail/movie_detail_args.dart';
import 'package:movie_app/presentation/ui/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/presentation/widgets/search_movie_card.dart';

class SearchMovieCard extends StatelessWidget {

  final MovieEntity movie;

  const SearchMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailScreen(
            movieDetailArguments: MovieDetailArguments(movie.id))));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: searchMovieCard(movie),
      ),
    );
  }

}