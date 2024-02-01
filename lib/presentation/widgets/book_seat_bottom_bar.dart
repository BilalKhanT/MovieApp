import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors_list.dart';

Widget bookSeatBottomBar(BuildContext context, int price) {
  var screenHeight = MediaQuery.of(context).size.height;
  return Row(
    children: <Widget>[
      Container(
        height: screenHeight * 0.1,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text('Total Price',
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),),
              Text('\$$price',
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),),
            ],
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: screenHeight * 0.1,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text('Proceed to pay',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),),
            ),
          ),
        ),
      ),
    ],
  );
}