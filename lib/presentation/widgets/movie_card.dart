import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/bloc/movie_trailer/movie_trailer_bloc.dart';
import 'package:movie_app/presentation/widgets/genre_list.dart';
import 'package:movie_app/presentation/widgets/load_trailer_btn.dart';
import '../../data/core/api_constants.dart';
import '../../domain/entities/movie_detial_entity.dart';
import '../../domain/entities/movie_local_entity.dart';
import '../bloc/movie_local/movie_local_bloc.dart';
import '../bloc/movie_local/movie_local_event.dart';
import '../bloc/movie_local/movie_local_state.dart';
import '../ui/get_ticket_screen/select_date_screen.dart';

Widget movieCard (MovieDetailEntity movie, BuildContext context, MovieTrailerBloc trailerBloc, MovieLocalBloc movieLocalBloc) {
  var screenHeight = MediaQuery.of(context).size.height;
  var screenWidth = MediaQuery.of(context).size.width;
  return Column(
    children: <Widget>[
      Container(
        width: screenWidth,
        height: screenHeight * 0.55,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider('${ApiConstants.baseImageUrl}${movie.posterPath}'),
          fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: screenHeight * 0.05,),
            ListTile(
              leading: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
              ),
              title: Text('Watch',
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade200,
                  fontSize: 16,
                ),),
              trailing: BlocBuilder<MovieLocalBloc, MovieLocalState>(
                bloc: movieLocalBloc,
                builder: (context, state) {
                  StarredMovieEntity movieEntity = StarredMovieEntity(
                    movie.id,
                    movie.title,
                    movie.posterPath,
                    movie.releaseDate,
                  );
                  return IconButton(
                    onPressed: () => BlocProvider.of<MovieLocalBloc>(context).add(SaveMovieEvent(movieEntity)),
                    icon: const Icon(Icons.favorite, color: Colors.white,),
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.15,),
            Text('In Theaters ${movie.releaseDate}',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),
            SizedBox(height: screenHeight * 0.02,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectDateScreen(movieTitle: movie.title, date: movie.releaseDate,)));
              },
              child: Container(
                width: screenWidth - 150,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text('Get Tickets',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02,),
            loadTrailerButton(trailerBloc, context),
          ],
        ),
      ),
      SizedBox(
        width: screenWidth,
        height: screenHeight * 0.45,
        child: Center(
          child: SizedBox(
            width: screenWidth - 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.02,),
                Text('Genres',
                style: GoogleFonts.poppins(
                  color: Colors.grey.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(
                  height: screenHeight * 0.06,
                  child: genreList(movie.genreIds, context),
                ),
                SizedBox(height: screenHeight * 0.04,),
                Text('Overview',
                  style: GoogleFonts.poppins(
                      color: Colors.grey.shade900,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),),
                SizedBox(height: screenHeight * 0.02,),
                Text(movie.overview,
                  style: GoogleFonts.poppins(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                maxLines: 7,
                overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}