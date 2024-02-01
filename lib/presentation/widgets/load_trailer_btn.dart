import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/bloc/movie_trailer/movie_trailer_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_trailer/movie_trailer_state.dart';
import 'package:movie_app/presentation/ui/trailer_video/trailer_vid_args.dart';
import 'package:movie_app/presentation/ui/trailer_video/trailer_video_screen.dart';
import 'package:movie_app/utils/colors_list.dart';

Widget loadTrailerButton(
    MovieTrailerBloc movieTrailerBloc, BuildContext context) {
  var screenHeight = MediaQuery.of(context).size.height;
  var screenWidth = MediaQuery.of(context).size.width;
  return BlocBuilder(
    bloc: movieTrailerBloc,
    builder: (context, state) {
      if (state is MovieTrailerLoaded && state.trailers.iterator.moveNext()) {
        final trailers = state.trailers;
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TrailerVideoScreen(
                    trailerVideoArgs: TrailerVideoArgs(trailers))));
          },
          child: Container(
            width: screenWidth - 150,
            height: screenHeight * 0.07,
            decoration: BoxDecoration(
              color: fillColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                'Watch Trailer',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    },
  );
}
