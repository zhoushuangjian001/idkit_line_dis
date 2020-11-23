part of idkit_line;

class IDKitRegularLine extends CustomPainter {
  const IDKitRegularLine({
    this.color,
    this.paintWidth = 1,
    this.direction = Direction.horizontal,
  });

  /// The [color] of paint,default 0xffa3a3a3.
  final Color color;

  /// The [paintWidth] of paint,default 1.
  final double paintWidth;

  /// Direction of wave line, default horizontal.
  final Direction direction;

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
    final p1 = isHorizontal
        ? Offset(0, paintWidth * 0.5)
        : Offset(paintWidth * 0.5, 0);
    final p2 = isHorizontal
        ? Offset(_size, paintWidth * 0.5)
        : Offset(paintWidth * 0.5, _size);
    canvas.drawLine(p1, p2, paint);
    // Canvas pop.
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
