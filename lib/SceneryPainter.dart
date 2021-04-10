import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class SceneryPainter extends CustomPainter {
  SceneryPainter({
    required this.petalFillColor,
    required this.petalStrokeColor,
    required this.stemColor,
    required this.skyColor,
    required this.groundColor,
    required this.midPointX,
    required this.textHeight,
    required this.drawSun,
    required this.drawMoon,
  });

  final Color petalFillColor;
  final Color petalStrokeColor;
  final Color stemColor;
  final Color skyColor;
  final Color groundColor;
  final double midPointX;
  final double textHeight;
  final bool drawSun;
  final bool drawMoon;

  final _paint = Paint();
  final _flowerInnerRadius = 7.0;
  final _petalCtrlPtHeight = 100.0;
  final _numPetals = 10;
  final _flowerCenterY = 170.0;

  Offset _center = Offset.zero;
  double _canvasHeight = 0;

  @override
  void paint(Canvas canvas, Size size) {
    _center = Offset(midPointX, _flowerCenterY);
    _canvasHeight = size.height - textHeight;
    final skyHeight = _canvasHeight * .66;
    _paint.color = skyColor;
    canvas.drawRect(Rect.fromPoints(Offset.zero, Offset(size.width, skyHeight)), _paint);

    final _flower = _flowerPath(canvas);
    _drawFlower(
      canvas: canvas,
      flowerPath: _flower,
    );
    if (drawSun) {
      _drawSun(canvas);
    }
    if (drawMoon) {
      _drawMoon(canvas);
    }
  }

  Path _flowerPath(Canvas canvas) {
    Path path = Path();
    double theta = 0;
    double innerWidthSweep = _innerSweep(_numPetals);
    double outerWidthDelta = _outerWidthDelta(_numPetals);

    for (int i = 0; i < _numPetals; i++) {
      theta = theta + 2 * pi / _numPetals;
      Offset startPoint = Offset(_flowerInnerRadius * cos(theta), _flowerInnerRadius * sin(theta)) + _center;
      path.moveTo(startPoint.dx, startPoint.dy);
      Offset endPt = Offset(
            _flowerInnerRadius * cos(theta + innerWidthSweep),
            _flowerInnerRadius * sin(theta + innerWidthSweep),
          ) +
          _center;
      Offset ctrlPt1 = Offset(
            (_flowerInnerRadius + _petalCtrlPtHeight) * cos(theta - outerWidthDelta),
            (_flowerInnerRadius + _petalCtrlPtHeight) * sin(theta - outerWidthDelta),
          ) +
          _center;
      Offset ctrlPt2 = Offset(
            (_flowerInnerRadius + _petalCtrlPtHeight) * cos(theta + innerWidthSweep + outerWidthDelta),
            (_flowerInnerRadius + _petalCtrlPtHeight) * sin(theta + innerWidthSweep + outerWidthDelta),
          ) +
          _center;
      path.cubicTo(ctrlPt1.dx, ctrlPt1.dy, ctrlPt2.dx, ctrlPt2.dy, endPt.dx, endPt.dy);
    }

    path.addPath(
        _insidePath(
          _center,
        ),
        Offset.zero);
    return path;
  }

  double _innerSweep(int numPetals) => 2 * pi / numPetals;

  double _outerWidthDelta(int numPetals) => pi / (numPetals * 8);

  Path _insidePath(
    Offset center,
  ) {
    Path path = Path();
    double theta = 0;
    for (int i = 0; i < _numPetals; i++) {
      theta = theta + 2 * pi / _numPetals;
      double innerWidthSweep = _innerSweep(_numPetals);
      final midTheta = theta + innerWidthSweep / 2;
      final midLineLength = _petalCtrlPtHeight / 4;

      final innerMidPt = Offset(
            _flowerInnerRadius * cos(midTheta),
            _flowerInnerRadius * sin(midTheta),
          ) +
          center;
      final outerMidPt = Offset(
            (_flowerInnerRadius + midLineLength / 2) * cos(midTheta),
            (_flowerInnerRadius + midLineLength / 2) * sin(midTheta),
          ) +
          center;
      path.moveTo(
        innerMidPt.dx,
        innerMidPt.dy,
      );
      path.lineTo(
        outerMidPt.dx,
        outerMidPt.dy,
      );
    }
    path.addOval(
      Rect.fromCircle(
        center: center,
        radius: _flowerInnerRadius,
      ),
    );
    return path;
  }

  Path _stemPath(Canvas canvas) {
    Path path = Path();
    final startPt = Offset(_center.dx - _petalCtrlPtHeight / 4, _center.dy);
    path.moveTo(startPt.dx, startPt.dy);
    final endPoint = Offset(midPointX, _canvasHeight);
    final dy = (_canvasHeight - _center.dy) / 3;
    final dx = 50.0;
    final ctrlPt1 = startPt + Offset(2 * dx, dy);
    final ctrlPt2 = startPt + Offset(-dx, 2 * dy);
    path.cubicTo(
      ctrlPt1.dx,
      ctrlPt1.dy,
      ctrlPt2.dx,
      ctrlPt2.dy,
      endPoint.dx,
      endPoint.dy,
    );
    return path;
  }

  void _drawFlower({
    required Canvas canvas,
    required Path flowerPath,
  }) {
    _paint.color = stemColor;
    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = 6;
    canvas.drawPath(_stemPath(canvas), _paint);
    _paint.style = PaintingStyle.fill;
    _paint.color = petalFillColor;
    canvas.drawPath(flowerPath, _paint);
    _paint.color = petalStrokeColor;
    _paint.style = PaintingStyle.stroke;
    _paint.strokeWidth = 3;
    _paint.strokeCap = StrokeCap.round;
    canvas.drawPath(flowerPath, _paint);
  }

  void _drawSun(Canvas canvas) {
    final sunCenter = _center - Offset(3 * midPointX / 4, _center.dy / 2);
    final innerRadius = 40.0;
    final outerRadius = innerRadius + innerRadius / 3;
    final sunColor = Colors.yellowAccent;
    _paint.color = sunColor;
    _paint.style = PaintingStyle.fill;
    canvas.drawCircle(sunCenter, innerRadius, _paint);

    final paintWithShader = Paint();
    paintWithShader.shader = RadialGradient(
      colors: [
        sunColor.withOpacity(1),
        sunColor.withOpacity(.02),
      ],
    ).createShader(Rect.fromCircle(
      center: sunCenter,
      radius: outerRadius,
    ));
    canvas.drawCircle(sunCenter, outerRadius, paintWithShader);
  }

  void _drawMoon(Canvas canvas) {
    final moonCenter = _center + Offset(3 * midPointX / 4, -_center.dy / 2);
    final outerRadius = 40.0;
    final innerRadius = outerRadius * .75;
    final glowRadius = outerRadius + outerRadius / 3;
    final moonColor = Colors.grey[300];
    _paint.color = moonColor!;
    _paint.style = PaintingStyle.fill;
    canvas.drawCircle(moonCenter, outerRadius, _paint);
    _paint.color = skyColor;
    final clipCenter = moonCenter + Offset(innerRadius / 2, 0);
    canvas.drawCircle(clipCenter, innerRadius, _paint);

    final paintWithShader = Paint();
    paintWithShader.shader = RadialGradient(
      colors: [
        moonColor.withOpacity(.5),
        moonColor.withOpacity(.1),
      ],
    ).createShader(Rect.fromCircle(
      center: moonCenter, // - Offset(3 * innerRadius / 4, 0),
      radius: glowRadius,
    ));
    canvas.drawCircle(moonCenter, glowRadius, paintWithShader);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
