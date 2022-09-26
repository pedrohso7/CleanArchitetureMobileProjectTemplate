import 'package:flutter/material.dart';

class AnimatedBlueBackground extends StatelessWidget {
  final bool startAnimation;

  const AnimatedBlueBackground({Key? key, required this.startAnimation})
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
              // color: context.theme.primaryColor,
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: Image.asset(
              'lib/assets/images/brain.png',
            ),
          ),
        ],
      ),
    );
  }
}
