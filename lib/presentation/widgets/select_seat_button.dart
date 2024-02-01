import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/ui/get_ticket_screen/seat_book_screen.dart';
import '../../utils/colors_list.dart';

Widget selectSeatButton(BuildContext context, double screenHeight, String movieTitle, String date, String hall ) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => SeatBookingScreen(movieTitle: movieTitle, date: date, hall: hall)));
    },
    child: Container(
      height: screenHeight * 0.08,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text('Select Seats',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),),
      ),
    ),
  );
}