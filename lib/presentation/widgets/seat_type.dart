import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/utils/colors_list.dart';

Widget seatType (Color color, String text) {
  return SizedBox(
    child: Row(
      children: <Widget>[
        Icon(Icons.event_seat, color: color,),
        const SizedBox(width: 10.0,),
        Text(text,
        style: GoogleFonts.poppins(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),),
      ],
    ),
  );
}