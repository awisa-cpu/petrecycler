import 'package:flutter/material.dart';

class CustomCurvedClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    //first curve
    final firstCurveBend1 = Offset(0, size.height - 20);
    final firstCurveBend2 = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstCurveBend1.dx, firstCurveBend1.dy,
        firstCurveBend2.dx, firstCurveBend2.dy);

    //straight line
    final firstStraightLineCurve = Offset(0, size.height - 20);
    final secondStraightLineCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(firstStraightLineCurve.dx, firstStraightLineCurve.dy,
        secondStraightLineCurve.dx, secondStraightLineCurve.dy);

    //second curve
    final secondCurveBend1 = Offset(size.width, size.height - 20);
    final secondCurveBend2 = Offset(size.width, size.height);
    path.quadraticBezierTo(secondCurveBend1.dx, secondCurveBend1.dy,
        secondCurveBend2.dx, secondCurveBend2.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
