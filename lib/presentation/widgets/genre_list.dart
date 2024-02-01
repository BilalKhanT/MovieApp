import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget genreList (List genres, BuildContext context) {
  var screenHeight = MediaQuery.of(context).size.height;
  var screenWidth = MediaQuery.of(context).size.width;
  List colorCode = const [
    Color(0xFF04E6D8),
    Color(0xFFFF1493),
    Color(0xFF673AB7),
    Color(0xFFDAA520),

  ];
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: genres.length,
    itemBuilder: (context, index) {
      final genre = genres[index];
      return Container(
        height: screenHeight * 0.02,
        width: screenWidth - 300,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: colorCode[index],
        ),
        child: Center(
          child: Text(genre.name,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,),
        ),
      );
    }
  );
}