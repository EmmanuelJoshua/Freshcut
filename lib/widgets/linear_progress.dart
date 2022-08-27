import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freshcut_test/utils/theme.dart';

class LinearProgress extends StatelessWidget {
  final double progress;

  const LinearProgress({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomPaint(
        child: Container(),
        painter: LinePainter(progress: progress),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final double progress;

  LinePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    double elevation = 25;
    Paint paint = Paint()
      ..color = Colors.white10
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    Offset p1 = Offset(0, size.height / 2);
    Offset p2 = Offset(size.width, size.height / 2);
    Offset pos = Offset(size.width * progress, size.height / 2);
    canvas.drawLine(p1, p2, paint);
    Rect rect = Rect.fromCircle(center: pos, radius: 3);

    //To make sure no drawing happens when the value is 0
    if (progress > 0) {
      canvas.drawLine(p1, pos, paint..color = kSunGold);

      //To make sure the glow doesn't show when value is 100%
      if (progress < 1) {
        canvas.drawArc(
          rect,
          0,
          pi * 2,
          false,
          paint
            ..color = Colors.white
            ..shader = const LinearGradient(
              colors: [Colors.white10, Colors.white60],
            ).createShader(rect),
        );

        canvas.drawShadow(
          Path()..addOval(rect.translate(0, -elevation)),
          white,
          elevation,
          false,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
