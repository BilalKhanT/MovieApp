import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/ui/home_screen/home_screen.dart';
import 'package:movie_app/presentation/ui/saved_screen/saved_movie_screen.dart';

Widget bottomAppBar(BuildContext context, int index) {
  return NavigationBarTheme(
    data: NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.all(
        GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      indicatorColor: Colors.grey.shade700,
      backgroundColor: Color(0xff281537),
      elevation: 0,
    ),
    child: NavigationBar(
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
        }
        else if (index == 2) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SavedMovieScreen()));
        }
      },
      selectedIndex: index,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.dashboard_outlined, color: Colors.white,), label: 'Dashboard',),
        NavigationDestination(icon: Icon(Icons.local_play_outlined, color: Colors.white,), label: 'Watch',),
        NavigationDestination(icon: Icon(Icons.my_library_music_outlined, color: Colors.white,), label: 'Media Library',),
        NavigationDestination(icon: Icon(Icons.tune_outlined, color: Colors.white,), label: 'More'),
      ],
    ),
  );
}