import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/bloc/movie_genres/movie_genre_bloc.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movie_bloc.dart';
import 'package:movie_app/presentation/ui/search_movie/custom_search_movie.dart';

Widget appBar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Watch',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w600,
            ),),
        IconButton(
          onPressed: (){
            showSearch(context: context, delegate: CustomSearchDelegate(BlocProvider.of<SearchMovieBloc>(context),
            BlocProvider.of<MovieGenreBloc>(context)));
          },
          icon: Icon(Icons.search_outlined),
          color: Colors.grey.shade800,)
      ],
    ),
  );
}