import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/data/core/api_constants.dart';

import '../../domain/entities/movie_entity.dart';

Widget searchMovieCard(MovieEntity movie) {
  return Row(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}',
            width: 80.0,
          ),
        ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(movie.title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w600,
            ),),
            Text(movie.overview,
            maxLines: 3,
            style: GoogleFonts.poppins(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    ],
  );
}