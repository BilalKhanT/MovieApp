import 'package:flutter/material.dart';
import 'package:movie_app/dependency_inject/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_genres/movie_genre_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_remote/movie_remote_bloc.dart';
import 'package:movie_app/presentation/bloc/search_movie/search_movie_bloc.dart';
import 'package:movie_app/presentation/widgets/bottom_app_bar.dart';
import '../../bloc/movie_remote/movie_remote_event.dart';
import '../../bloc/movie_remote/movie_remote_state.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/build_movie_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieRemoteBloc movieRemoteBloc;
  late SearchMovieBloc searchMovieBloc;
  late MovieGenreBloc movieGenreBloc;

  @override
  void initState() {
    super.initState();
    movieRemoteBloc = getItInstance<MovieRemoteBloc>();
    searchMovieBloc = getItInstance<SearchMovieBloc>();
    movieGenreBloc = getItInstance<MovieGenreBloc>();
    movieRemoteBloc.add(GetUpcomingMoviesEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieRemoteBloc?.close();
    searchMovieBloc?.close();
    movieGenreBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieRemoteBloc,
        ),
        BlocProvider(
          create: (context) => searchMovieBloc,
        ),
        BlocProvider(
            create: (context) => movieGenreBloc),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: bottomAppBar(context, 1),
        body: BlocBuilder<MovieRemoteBloc, MovieRemoteState>(
          bloc: movieRemoteBloc,
          builder: (context, state) {
            if (state is MovieRemoteLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieRemoteLoaded) {
              return SafeArea(
                child: Column(
                  children: <Widget>[
                    appBar(context),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Expanded(child: buildMovieList(state.movies, context)),
                  ],
                ),
              );
            } else if (state is MovieRemoteError) {
              return Center(
                child: Text('${state.message}'),
              );
            } else {
              return Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ),
    );
  }
}
