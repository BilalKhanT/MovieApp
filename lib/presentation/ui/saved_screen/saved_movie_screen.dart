import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/dependency_inject/get_it.dart';
import 'package:movie_app/presentation/bloc/movie_local/movie_local_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_local/movie_local_event.dart';
import 'package:movie_app/presentation/bloc/movie_local/movie_local_state.dart';
import 'package:movie_app/presentation/widgets/bottom_app_bar.dart';
import 'package:movie_app/presentation/widgets/saved_movies_list.dart';

class SavedMovieScreen extends StatefulWidget {
  const SavedMovieScreen({Key? key}) : super(key: key);

  @override
  State<SavedMovieScreen> createState() => _SavedMovieScreenState();
}

class _SavedMovieScreenState extends State<SavedMovieScreen> {

  late MovieLocalBloc movieLocalBloc;

  @override
  void initState() {
    super.initState();
    movieLocalBloc = getItInstance<MovieLocalBloc>();
    movieLocalBloc.add(LoadSavedMovieEvent());
  }

  @override
  void dispose() {
    movieLocalBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomAppBar(context, 2),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Favourite Movies',
        style: GoogleFonts.poppins(
          fontSize: 20,
          color: Colors.grey.shade900,
          fontWeight: FontWeight.w600,
        ),),
        centerTitle: true,
      ),
      body: BlocProvider.value(value: movieLocalBloc,
      child: BlocBuilder<MovieLocalBloc, MovieLocalState>(
          builder: (context, state) {
            if (state is MovieLocalLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text('No favourite movies',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),),
                );
              }
              return savedMovieList(context, state.movies);
            }
            else{
              return SizedBox.shrink();
            }
          },
      ),),
    );
  }
}
