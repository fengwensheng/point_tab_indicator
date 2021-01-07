library point_tab_indicator;

import 'package:flutter/material.dart';

class PointTabIndicator extends Decoration {
  final BoxPainter _painter;

  PointTabIndicator({
    Color color: Colors.blue,
    double radius: 5.0,
    bool showLine: false,
    Color lineColor: Colors.blue,
    double lineWidth: 5.0,
    double paddingBottom: 0.0,
  }) : _painter = _CirclePainter(
            color, radius, showLine, lineColor, lineWidth, paddingBottom);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;
  final bool showLine;
  final Color lineColor;
  final double lineWidth;
  final Paint _linePaint;
  final double _paddingBottom;
  _CirclePainter(
    Color color,
    this.radius,
    this.showLine,
    this.lineColor,
    this.lineWidth,
    this._paddingBottom,
  )   : _paint = Paint()
          ..color = color
          ..strokeWidth = radius
          ..strokeCap = StrokeCap.round,
        _linePaint = Paint()
          ..color = lineColor
          ..strokeWidth = lineWidth
          ..strokeCap = StrokeCap.round;
  @override
  void paint(Canvas canvas, Offset dxdy, ImageConfiguration cfg) {
    final offset =
        Offset(cfg.size.width / 2, cfg.size.height - radius - _paddingBottom);
    final circleOffset = offset + dxdy;
    if (showLine && dxdy.dx != 0) {
      canvas.drawLine(offset, offset + Offset(dxdy.dx, 0), _linePaint);
    }
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
