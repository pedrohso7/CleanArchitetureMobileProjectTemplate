import 'package:flutter/material.dart';

class FilledContainer extends StatelessWidget {
  final Widget child;
  final AlignmentGeometry alignment;
  const FilledContainer({
    Key? key,
    required this.child,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      alignment: alignment,
      child: child,
    );
  }
}
