import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/genre_entity.dart';
import '../../utils/colors_list.dart';

Widget categoriesTile (BuildContext context, List<GenreEntity> genres) {
  var screenHeight = MediaQuery.of(context).size.height;
  var screenWidth = MediaQuery.of(context).size.width;
  int totalGenres = genres.length;
  bool isEven = totalGenres % 2 == 0;
  int column1Count = isEven ? totalGenres ~/ 2 : (totalGenres ~/ 2) + 1;
  int column2Count = totalGenres - column1Count;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            itemCount: column1Count,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: screenHeight * 0.1,
                  width: screenWidth - 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: genreColors[index],
                  ),
                  child: Center(
                    child: Text(genres[index].genres[0].name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ),
              );
            },
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: column2Count,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: screenHeight * 0.1,
                  width: screenWidth - 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: genreColors[index+column1Count],
                  ),
                  child: Center(
                    child: Text(genres[index+column1Count].genres[0].name,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}