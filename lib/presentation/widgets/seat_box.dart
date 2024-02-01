import 'package:flutter/material.dart';

class SeatBox extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const SeatBox({super.key, required this.color, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.0,
      height: 15.0,
      decoration: BoxDecoration(
        color: isSelected ? Colors.yellow : color,
        border: Border.all(color: Colors.black),
      ),
    );
  }
}