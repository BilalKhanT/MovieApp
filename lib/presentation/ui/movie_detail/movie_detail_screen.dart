import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_local/movie_local_bloc.dart';
import 'package:movie_app/presentation/bloc/movie_trailer/movie_trailer_bloc.dart';
import 'package:movie_app/presentation/widgets/movie_card.dart';
import '../../../dependency_inject/get_it.dart';
import '../../bloc/movie_detail/movie_detail_bloc.dart';
import '../../bloc/movie_detail/movie_detail_event.dart';
import '../../bloc/movie_detail/movie_detail_state.dart';
import 'movie_detail_args.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    Key? key,
    required this.movieDetailArguments,
  })  : assert(movieDetailArguments != null, 'arguments must not be null'),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc movieDetailBloc;
  late MovieTrailerBloc movieTrailerBloc;
  late MovieLocalBloc movieLocalBloc;

  @override
  void initState() {
    super.initState();
    movieDetailBloc = getItInstance<MovieDetailBloc>();
    movieTrailerBloc = movieDetailBloc.movieTrailerBloc;
    movieLocalBloc = movieDetailBloc.movieLocalBloc;
    movieDetailBloc.add(
      MovieDetailLoadEvent(
        widget.movieDetailArguments.movieId,
      ),
    );
  }

  @override
  void dispose() {
    movieDetailBloc?.close();
    movieTrailerBloc?.close();
    movieLocalBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: movieDetailBloc),
            BlocProvider.value(value: movieTrailerBloc),
            BlocProvider.value(value: movieLocalBloc),
          ],
          child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
            bloc: movieDetailBloc,
            builder: (context, state) {
              if (state is MovieDetailLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MovieDetailLoaded) {
                final movieDetail = state.movieDetailEntity;
                return movieCard(movieDetail, context, movieTrailerBloc, movieLocalBloc);
              } else if (state is MovieDetailError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          ),
        ),
      );
  }
}