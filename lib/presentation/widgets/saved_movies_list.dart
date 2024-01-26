import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_app/presentation/bloc/movie_local/movie_local_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_local/movie_local_event.dart';
import 'package:movie_app/presentation/ui/saved_screen/saved_movie_screen.dart';
import '../../data/core/api_constants.dart';
import '../../domain/entities/movie_local_entity.dart';

Widget savedMovieList (BuildContext context, List<StarredMovieEntity> movies) {
  var screenHeight = MediaQuery.of(context).size.height;
  return ListView.builder(
    itemCount: movies.length,
    itemBuilder: (context, index) {
      var movie = movies[index];
      return Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                BlocProvider.of<MovieLocalBloc>(context).add(
                  DeleteSavedMovieEvent(movie),
                );},
              icon: Icons.delete,
              backgroundColor: Color(0xffB81736),
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(movie.title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                    ),),
                  SizedBox(height: screenHeight * 0.01,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.date_range_outlined, color: Colors.grey.shade900,),
                      SizedBox(width: 10.0,),
                      Text(movie.releaseDate,
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade900,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}