import 'package:flutter/material.dart';
import 'package:movie_app/utils/colors_list.dart';


class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    double height = size.height;
    double width = size.width;

    paint.color = fillColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.5;

    var  startPoint = Offset(0, height);
    var  controlPointA = Offset(width / 4, height / 4);
    var  controlPointB = Offset(3 * width / 4, height / 4);
    var  endPoint = Offset(width, height);
    
    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPointA.dx, controlPointA.dy, controlPointB.dx, controlPointB.dy, 
        endPoint.dx, endPoint.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}