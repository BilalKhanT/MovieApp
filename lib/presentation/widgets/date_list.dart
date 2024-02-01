import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors_list.dart';

class DateList extends StatefulWidget {
  final Function(int) onDateSelected;

  const DateList({Key? key, required this.onDateSelected}) : super(key: key);
  @override
  _DateListState createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  int? selectedDateIndex;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<String> monthNames = [
      "Jan", "Feb", "Mar", "Apr", "May", "June",
      "July", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    String currentMonthName = monthNames[now.month - 1];
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 30,
      itemBuilder: (context, index) {
        bool isCurrentlySelected = index == selectedDateIndex;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDateIndex = index;
            });
            widget.onDateSelected(1 + index);
          },
          child: Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              color: isCurrentlySelected ? fillColor : Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(child: Text('${1 + index} $currentMonthName',
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 14,
              ),)),
            ),
          ),
        );
      },
    );
  }
}