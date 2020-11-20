import 'package:flutter/material.dart';

class IDKitDottedLine extends CustomPainter {
  const IDKitDottedLine({
    this.color,
    this.paintWidth = 1,
    this.direction = Direction.horizontal,
    this.itemInterval = 6,
    this.itemLength = 3,
    this.itemShape = ItemShape.rectangle,
    this.strokeCap = StrokeCap.butt,
  });

  /// The [color] of paint,default 0xffa3a3a3.
  final Color color;

  /// The [paintWidth] of paint,default 1.
  final double paintWidth;

  /// Direction of wave line, default horizontal.
  final Direction direction;

  /// Spacing between elements.
  final double itemInterval;

  /// The length of the element.
  final double itemLength;

  /// The shape of the element.
  final ItemShape itemShape;

  /// Additional shape at end of line.
  final StrokeCap strokeCap;

  @override
  void paint(Canvas canvas, Size size) {
    // Check configuration.
    assert(
        size.width > 0, "It is unreasonable to draw the width of the canvas.");
    assert(size.height > 0,
        "It is unreasonable to draw the height of the canvas.");
    // Direction determination.
    final isHorizontal = direction == Direction.horizontal;
    final isRectangle = itemShape == ItemShape.rectangle;
    // Calculate the number of waves.
    final _size = isHorizontal ? size.width : size.height;
    final _length = itemLength + itemInterval;
    final _count = (_size / _length).floor();
    assert(_count > 1, "The number of elements is at least two.");
    final _intervalAll = _size - _count * itemLength;
    final _interval = _intervalAll / (_count - 1);
    // Save canvas.
    canvas.save();
    // Paint
    var paint = Paint()
      ..color = color ?? Color(0xffa3a3a3)
      ..strokeWidth = paintWidth
      ..strokeCap = strokeCap;

    // draw
    if (isRectangle) {
      Offset p1 = isHorizontal
          ? Offset(0, paintWidth * 0.5)
          : Offset(paintWidth * 0.5, 0);
      for (var i = 0; i < _count; i++) {
        var p2 = isHorizontal
            ? p1.translate(itemLength, 0)
            : p1.translate(0, itemLength);
        canvas.drawLine(p1, p2, paint);
        p1 = isHorizontal
            ? p2.translate(_interval, 0)
            : p2.translate(0, _interval);
      }
    } else {
      final _radius = itemLength * 0.5;
      Offset c = Offset(_radius, _radius);
      for (var i = 0; i < _count; i++) {
        canvas.drawCircle(c, _radius, paint);
        c = isHorizontal
            ? c.translate(itemLength + _interval, 0)
            : c.translate(0, itemLength + _interval);
      }
    }
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

enum ItemShape {
  circular,
  rectangle,
}
