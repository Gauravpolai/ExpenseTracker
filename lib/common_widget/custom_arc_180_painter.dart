import 'package:expense_tracker/common/color_extension.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:flutter/material.dart';

class ArcModel {
  final Color color;
  final double value;
  ArcModel({required this.color, required this.value});
}

class CustomArc180Painter extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final List<ArcModel> drwArcs;
  final double space;
  CustomArc180Painter(
      {required this.drwArcs,
      this.space = 0.1,
      this.start = 6.28319,
      this.end = 270,
      this.width = 15});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height * 0.9),
        radius: size.width / 2);

    Paint backgroudPaint = Paint();
    backgroudPaint.color = TColor.gray60;
    backgroudPaint.style = PaintingStyle.stroke;
    backgroudPaint.strokeWidth = width;
    backgroudPaint.strokeCap = StrokeCap.round;

    // Define the start angle and sweep angle in radians
    var drawStart = math.degrees(0);
    canvas.drawArc(
        rect, math.radians(170), math.radians(200), false, backgroudPaint);

    for (var arcObj in drwArcs) {
      var endVal = arcObj.value;
      Paint activePaint = Paint();
      activePaint.color = arcObj.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;
      print("Initial Drawstart: $drawStart");
      print("Initial endVal: $endVal");
      canvas.drawArc(rect, math.radians(170 + drawStart), math.radians(endVal),
          false, activePaint);
      drawStart = endVal + drawStart + 6.5;
      print("Next Drawstart: $drawStart");
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
