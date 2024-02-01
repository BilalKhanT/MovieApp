import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/utils/colors_list.dart';

class HallList extends StatefulWidget {
  final Function(String) onHallSelected;
  const HallList({Key? key, required this.onHallSelected}) : super(key: key);

  @override
  State<HallList> createState() => _HallListState();
}

class _HallListState extends State<HallList> {
  int? selectedDateIndex;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (context, index) {
        bool isCurrentlySelected = index == selectedDateIndex;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(index == 0 ? '12:30 Cinetech + Hall 1' : '13:30 Cinetech + Hall 2',
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedDateIndex = index;
                });
                widget.onHallSelected(index == 0 ? 'Hall 1' : 'Hall 2');
              },
              child: Container(
                margin: const EdgeInsets.all(10.0),
                height: screenHeight * 0.3,
                width: 250,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/hallImg.jpeg"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  border: isCurrentlySelected ? Border.all(
                    color: fillColor,
                    width: 1.5,
                  ) : Border.all(width: 0, color: Colors.transparent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(index == 0 ? 'From 50\$ or 2500 bonus' : 'From 75\$ or 3000 bonus',
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
            ),
          ],
        );
      },
    );
  }
}
