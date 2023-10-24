import 'package:flutter/material.dart';

import '../../../../../core/constants/assets/image_path.dart';
import '../../../../../core/constants/theme/colors.dart';

class AnimatedBackground extends StatelessWidget {
  final bool startAnimation;

  const AnimatedBackground({Key? key, required this.startAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return AnimatedContainer(
      curve: Curves.linear,
      width: mq.size.width,
      height: startAnimation ? mq.size.height * 0.4 : 0,
      duration: const Duration(milliseconds: 1000),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomPaint(
              size: const Size(180, 180),
              painter: DrawTriangleShape(),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, 20),
            child: Transform.scale(
              scale: 0.35,
              child: Image.asset(
                AppImages.logoPath,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawTriangleShape extends CustomPainter {
  late final Paint painter;

  DrawTriangleShape() {
    painter = Paint()
      ..color = AppColors.backgroundColor
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
