import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/ui/movie_detail/movie_detail_args.dart';
import 'package:movie_app/presentation/ui/movie_detail/movie_detail_screen.dart';
import '../../domain/entities/movie_entity.dart';

Widget buildMovieList(List<MovieEntity> movies, BuildContext context) {
  var screenHeight = MediaQuery.of(context).size.height;
  return ListView.builder(
    itemCount: movies.length,
    padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
    itemBuilder: (context, index) {
      final movie = movies[index];
      return Material(
        elevation: 30.0,
        borderRadius: BorderRadius.circular(15.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailScreen(movieDetailArguments: MovieDetailArguments(movie.id))));
          },
          child: Container(
            height: screenHeight * 0.23,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      '${ApiConstants.baseImageUrl}${movie.posterPath}'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 20.0),
                  child: Text(
                    movie.title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
