import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors_list.dart';

Widget bookScreenAppBar (BuildContext context, String movieTitle, String date, String hall, double width) {
  return Row(
    children: [
      IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_new,
        color: textColor,)),
      SizedBox(width: width,),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(movieTitle,
            style: GoogleFonts.poppins(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(date,
                style: GoogleFonts.poppins(
                  color: fillColor,
                  fontSize: 14,
                ),),
              Text(' | ',
                style: GoogleFonts.poppins(
                  color: fillColor,
                  fontSize: 14,
                ),),
              Text(hall,
                style: GoogleFonts.poppins(
                  color: fillColor,
                  fontSize: 14,
                ),),
            ],
          ),
        ],
      ),
    ],
  );
}