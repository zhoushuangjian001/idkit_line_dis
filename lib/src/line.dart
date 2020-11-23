part of idkit_line;

class IDKitLine extends StatelessWidget {
  const IDKitLine({
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.painter,
    this.alignment,
  });

  /// Set the [width] of the IDKitLine for the line.
  final double width;

  /// Set the [height] of the IDKitLine for the line.
  final double height;

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsets margin;

  /// Empty space to inscribe inside the [decoration]. The [child], if any, is
  /// placed inside this padding.
  final EdgeInsets padding;

  /// The painter that paints before the children.
  final CustomPainter painter;

  /// Align the [child] within the IDKitLine.
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      alignment: alignment,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomPaint(
            painter: painter,
            size: Size(constraints.maxWidth, constraints.maxHeight),
          );
        },
      ),
    );
  }
}

/// The direction of the line.
enum Direction {
  horizontal,
  vertical,
}
