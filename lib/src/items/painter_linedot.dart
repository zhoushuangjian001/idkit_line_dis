part of idkit_line;

class IDKitLinedot extends CustomPainter {
  const IDKitLinedot({
    this.color,
    this.paintWidth = 1,
    this.direction = Direction.horizontal,
    this.itemInterval = 6,
    this.itemLength = 3,
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
    // Calculate the number of waves.
    final _size = isHorizontal ? size.width : size.height;
    final _length = itemLength + paintWidth + itemInterval * 2;
    // How many elements can be calculated.
    final _count = (_size / _length).floor();
    assert(_count > 1, "The number of elements is at least two.");
    // Interval after processing.
    final _intervalAll =
        _size - (_count + 1) * itemLength - paintWidth * _count;
    final _interval = _intervalAll / (_count * 2);
    // Save canvas.
    canvas.save();
    // Set paint.
    var paint = Paint()
      ..color = color ?? Color(0xffa3a3a3)
      ..strokeWidth = paintWidth
      ..strokeCap = strokeCap;
    // Start point.
    var _half = paintWidth * 0.5;
    Offset p1 = isHorizontal ? Offset(0, _half) : Offset(_half, 0);
    for (var i = 0; i < _count; i++) {
      var p2 = isHorizontal
          ? p1.translate(itemLength, 0)
          : p1.translate(0, itemLength);
      canvas.drawLine(p1, p2, paint);
      p2 = isHorizontal
          ? p2.translate(_interval + _half, 0)
          : p2.translate(0, _interval + _half);
      canvas.drawCircle(p2, _half, paint);
      p1 = isHorizontal
          ? p2.translate(_interval + _half, 0)
          : p2.translate(0, _interval + _half);
    }
    var p2 = isHorizontal
        ? p1.translate(itemLength, 0)
        : p1.translate(0, itemLength);
    canvas.drawLine(p1, p2, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
