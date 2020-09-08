import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);

  void _drawCenterDots(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final Offset center = Offset(centerX, centerY);

    Paint dotPaint = Paint()..color = Theme.of(context).primaryIconTheme.color;
    Paint bgPaint = Paint()..color = Theme.of(context).backgroundColor;

    canvas.drawCircle(center, 24, dotPaint);
    canvas.drawCircle(center, 23, bgPaint);
    canvas.drawCircle(center, 10, dotPaint);
  }

  void _drawSecondLine(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final Offset center = Offset(centerX, centerY);

    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    Paint secondLinePaint = Paint()
      ..color = Theme.of(context).primaryColor
      ..strokeWidth = 2;
    canvas.drawLine(center, Offset(secondX, secondY), secondLinePaint);
  }

  void _drawMinuteLine(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final Offset center = Offset(centerX, centerY);

    double minuteX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minuteY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    Paint minuteLinePaint = Paint()
      ..strokeWidth = 10
      ..color = Theme.of(context).accentColor
      ..style = PaintingStyle.stroke;
    canvas.drawLine(center, Offset(minuteX, minuteY), minuteLinePaint);
  }

  void _drawHourLine(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final Offset center = Offset(centerX, centerY);

    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    Paint hourLinePaint = Paint()
      ..strokeWidth = 10
      ..color = Theme.of(context).colorScheme.secondary
      ..style = PaintingStyle.stroke;
    canvas.drawLine(center, Offset(hourX, hourY), hourLinePaint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawHourLine(canvas, size);
    _drawMinuteLine(canvas, size);
    _drawSecondLine(canvas, size);
    _drawCenterDots(canvas, size);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => false;
}
