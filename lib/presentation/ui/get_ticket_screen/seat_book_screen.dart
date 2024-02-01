import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/widgets/book_screen_app_bar.dart';
import 'package:movie_app/presentation/widgets/book_seat_bottom_bar.dart';
import 'package:movie_app/presentation/widgets/curve_painter.dart';
import 'package:movie_app/utils/colors_list.dart';
import '../../widgets/seat_box.dart';
import '../../widgets/seat_type.dart';

class SeatBookingScreen extends StatefulWidget {
  final String movieTitle;
  final String date;
  final String hall;

  const SeatBookingScreen({super.key,required this.movieTitle, required this.date, required this.hall});
  @override
  _SeatBookingScreenState createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBookingScreen> {
  Set<String> selectedSeats = Set<String>();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            bookScreenAppBar(context, widget.movieTitle, widget.date, widget.hall, 120.0),
            Center(
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.4,
                padding: const EdgeInsets.all(10.0),
                color: Colors.grey.shade300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPaint(
                      painter: CurvePainter(),
                      child: SizedBox(
                        height: screenHeight * 0.10,
                        width: screenWidth * 0.7,
                      ),
                    ),
                    Center(
                      child: Text(
                        'Screen',
                        style: GoogleFonts.poppins(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03,),
                    for (int row = 1; row <= 5; row++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int seat = 1; seat <= 8; seat++)
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  String seatId = '$row-$seat';
                                  setState(() {
                                    if (selectedSeats.contains(seatId)) {
                                      selectedSeats.remove(seatId);
                                    } else {
                                      selectedSeats.add(seatId);
                                    }
                                  });
                                },
                                child: SeatBox(
                                  color: getSeatColor(row, seat),
                                  isSelected: selectedSeats.contains('$row-$seat'),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.1,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    seatType(selectColor, 'Selected   '),
                    seatType(Colors.grey, 'Not available'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    seatType(vipColor, 'VIP (150\$)'),
                    seatType(regularColor, 'Regular (50\$)'),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: bookSeatBottomBar(context, 50),
            ),
          ],
        ),
      ),
    );
  }

  Color getSeatColor(int row, int seat) {
    if (row == 5) {
      return vipColor;
    } else if (selectedSeats.contains('$row-$seat')) {
      return selectColor;
    } else {
      return regularColor;
    }
  }
}