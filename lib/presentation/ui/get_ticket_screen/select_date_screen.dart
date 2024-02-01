import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/widgets/book_screen_app_bar.dart';
import 'package:movie_app/presentation/widgets/date_list.dart';
import 'package:movie_app/presentation/widgets/hall_list.dart';
import 'package:movie_app/presentation/widgets/select_seat_button.dart';
import 'package:movie_app/utils/colors_list.dart';

class SelectDateScreen extends StatefulWidget {
  final String movieTitle;
  final String date;
  const SelectDateScreen({Key? key, required this.movieTitle, required this.date}) : super(key: key);

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  int selectedDate = 1;
  String selectedHall = 'Hall 1S';
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            bookScreenAppBar(context, widget.movieTitle, 'In Theaters ${widget.date}', '', 70.0),
            SizedBox(height: screenHeight * 0.03,),
            Center(
              child: SizedBox(
                width: screenWidth - 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Date',
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),),
                    SizedBox(
                      height: screenHeight * 0.1,
                      child: DateList(
                        onDateSelected: (_date) {
                          setState(() {
                            selectedDate = _date;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05,),
                    SizedBox(
                      height: screenHeight * 0.5,
                      child: HallList(
                        onHallSelected: (hall) {
                          setState(() {
                            selectedHall = hall;
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: selectSeatButton(
                        context,
                        screenHeight,
                        widget.movieTitle,
                        selectedDate.toString() ,
                        selectedHall!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
