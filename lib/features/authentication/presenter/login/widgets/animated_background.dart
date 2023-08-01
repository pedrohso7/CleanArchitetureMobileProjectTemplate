import 'package:clean_architeture_project/core/constants/color_constants.dart';
import 'package:clean_architeture_project/core/constants/image_path_constants.dart';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatelessWidget {
  final bool startAnimation;

  const AnimatedBackground({Key? key, required this.startAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return AnimatedContainer(
      curve: Curves.easeOutCubic,
      height: startAnimation ? mq.size.height * 0.4 : 0,
      duration: const Duration(milliseconds: 800),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ColorsConstants.primaryColor,
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
              scale: 0.7,
              child: Image.asset(
                ImagePathConstants.brainLogoPath,
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
      ..color = ColorsConstants.defaultBackgroundColor
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
