import 'dart:ui';

import 'package:flutter/material.dart';

class SceneryPainter extends CustomPainter {
  SceneryPainter({
    required this.waterColor,
    required this.mountainColor,
    required this.skyColor,
    required this.textHeight,
    required this.drawSun,
    required this.drawMoon,
  });

  final Color waterColor;
  final Color mountainColor;
  final Color skyColor;
  final double textHeight;
  final bool drawSun;
  final bool drawMoon;

  final _paint = Paint();

  Offset _center = Offset.zero;
  double _canvasHeight = 0;

  @override
  void paint(Canvas canvas, Size size) {
    _canvasHeight = size.height - textHeight;
    _center = Offset(size.width / 2, _canvasHeight / 2);

    _drawSeaAndSky(canvas, size);
    _drawMountains(
      canvas: canvas,
      size: size,
      isMountain: true,
    );
    _drawMountains(
      canvas: canvas,
      size: size,
      isMountain: false,
    );

    if (drawSun) {
      _drawSun(canvas);
    }
    if (drawMoon) {
      _drawMoon(canvas);
    }
  }

  void _drawSeaAndSky(Canvas canvas, Size size) {
    final skyHeight = _canvasHeight * .66;
    _paint.color = skyColor;
    canvas.drawRect(
      Rect.fromPoints(Offset.zero, Offset(size.width, skyHeight)),
      _paint,
    );
    _paint.color = waterColor;
    canvas.drawRect(
      Rect.fromPoints(Offset(0, skyHeight), Offset(size.width, _canvasHeight)),
      _paint,
    );
  }

  void _drawMountains({
    required Canvas canvas,
    required Size size,
    required bool isMountain,
  }) {
    double reflectionHeightDelta;
    int upOrDown;
    final skyHeight = _canvasHeight * .66;
    if (isMountain) {
      _paint.color = mountainColor;
      reflectionHeightDelta = 0;
      upOrDown = 1;
    } else {
      _paint.color = Colors.black12;
      reflectionHeightDelta = skyHeight * 2;
      upOrDown = -1;
    }

    final leftMtLeftPt = Offset(0, reflectionHeightDelta + upOrDown * skyHeight);
    final leftMtPeakPt = Offset(size.width / 4, reflectionHeightDelta + upOrDown * _canvasHeight * .5);
    final leftMtRtPt = Offset(size.width / 2, reflectionHeightDelta + upOrDown * _canvasHeight * .58);
    final rtMtPeakPt = Offset(3 * size.width / 4, reflectionHeightDelta + upOrDown * _canvasHeight * .4);
    final rtMtRtPt = Offset(size.width, reflectionHeightDelta + upOrDown * skyHeight);

    final mtPath = Path();
    mtPath.moveTo(leftMtLeftPt.dx, leftMtLeftPt.dy);
    mtPath.lineTo(leftMtPeakPt.dx, leftMtPeakPt.dy);
    mtPath.lineTo(leftMtRtPt.dx, leftMtRtPt.dy);
    mtPath.lineTo(rtMtPeakPt.dx, rtMtPeakPt.dy);
    mtPath.lineTo(rtMtRtPt.dx, rtMtRtPt.dy);

    canvas.drawPath(mtPath, _paint);
  }

  void _drawSun(Canvas canvas) {
    final sunCenter = _center - Offset(3 * _center.dx / 4, _center.dy / 2);
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
    final moonCenter = _center + Offset(3 * _center.dx / 4, -_center.dy / 2);
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
      center: moonCenter,
      radius: glowRadius,
    ));
    canvas.drawCircle(moonCenter, glowRadius, paintWithShader);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
