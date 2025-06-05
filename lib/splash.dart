import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMain();
  }

  void _navigateToMain() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/catalog');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            'assets/imagess/shopping cart.png',
            fit: BoxFit.contain,
            width: 120,
            height: 120,
          ),
        ),
      ),
    );
  }
}

class DottedCartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    // Draw cart body
    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.3)
      ..lineTo(size.width * 0.8, size.height * 0.3)
      ..lineTo(size.width * 0.9, size.height * 0.7)
      ..lineTo(size.width * 0.1, size.height * 0.7)
      ..close();

    // Draw cart handle
    path
      ..moveTo(size.width * 0.3, size.height * 0.3)
      ..lineTo(size.width * 0.3, size.height * 0.1)
      ..lineTo(size.width * 0.7, size.height * 0.1)
      ..lineTo(size.width * 0.7, size.height * 0.3);

    // Draw wheels
    final wheelPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Left wheel
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.8),
      size.width * 0.1,
      wheelPaint,
    );

    // Right wheel
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.8),
      size.width * 0.1,
      wheelPaint,
    );

    // Draw dotted lines
    const dashWidth = 5.0;
    const dashSpace = 5.0;
    double distance = 0.0;

    for (var pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final start = pathMetric.getTangentForOffset(distance)?.position;
        final end =
            pathMetric.getTangentForOffset(distance + dashWidth)?.position;

        if (start != null && end != null) {
          canvas.drawLine(start, end, paint);
        }

        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
