import 'dart:math' show sin;
import 'package:flutter/material.dart'
    show
        CustomPainter,
        Color,
        Canvas,
        Size,
        Paint,
        PaintingStyle,
        StrokeJoin,
        Path;

class IDKitWaveLine extends CustomPainter {
  const IDKitWaveLine({
    this.color,
    this.paintWidth = 1,
    this.direction = Direction.vertical,
    this.peak = 6,
  });

  /// The [color] of paint,default 0xffa3a3a3.
  final Color color;

  /// The [paintWidth] of paint,default 1.
  final double paintWidth;

  /// Direction of wave line, default horizontal.
  final Direction direction;

  /// Peak value of wave line,default 6.
  final double peak;

  @override
  void paint(Canvas canvas, Size size) {
    // Check configuration.
    assert(
        size.width > 0, "It is unreasonable to draw the width of the canvas.");
    assert(size.height > 0,
        "It is unreasonable to draw the height of the canvas.");
    // Direction determination.
    final isHorizontal = direction == Direction.horizontal;
    // Calculate the number of waves.
    final _size = isHorizontal ? size.width : size.height;
    // Save current canvas.
    canvas.save();
    // Set paint.
    var paint = Paint()
      ..isAntiAlias = true
      ..color = color ?? Color(0xffa3a3a3)
      ..strokeWidth = paintWidth
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;
    // Path calculation.
    var path = Path();
    isHorizontal ? path.moveTo(0, peak) : path.moveTo(peak, 0);
    for (var i = 0; i < _size; i++) {
      var y = sin(i) * peak + peak;
      isHorizontal
          ? path.lineTo(i.toDouble(), y)
          : path.lineTo(y, i.toDouble());
    }
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

enum Direction {
  horizontal,
  vertical,
}
