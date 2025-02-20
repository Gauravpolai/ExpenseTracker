import 'package:expense_tracker/common/color_extension.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:flutter/material.dart';

class CustomArcPainter extends CustomPainter {
  final double start;
  final double end;
  final double width;

  CustomArcPainter({this.start = 0, this.end = 270, this.width = 15});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    var gradientColor = LinearGradient(
      colors: [
        TColor.secondary,
        TColor.secondary50,
        TColor.secondary0,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    Paint activePaint = Paint()..shader = gradientColor.createShader(rect);

    activePaint.style = PaintingStyle.stroke;
    activePaint.strokeWidth = width;
    activePaint.strokeCap = StrokeCap.round;

    Paint backgroudPaint = Paint();
    backgroudPaint.color = TColor.gray60;
    backgroudPaint.style = PaintingStyle.stroke;
    backgroudPaint.strokeWidth = width;
    backgroudPaint.strokeCap = StrokeCap.round;

    // Define the start angle and sweep angle in radians
    double startAngle = math.radians(135) + start;
    double sweepAngle = math.radians(270);

    // Draw the arcs
    canvas.drawArc(rect, startAngle, sweepAngle, false, backgroudPaint);
    canvas.drawArc(
        rect, startAngle, math.radians(end), false, activePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
