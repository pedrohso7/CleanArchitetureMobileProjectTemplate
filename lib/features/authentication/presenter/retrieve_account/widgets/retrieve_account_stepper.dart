import 'package:clean_architeture_project/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class RetrieveAccountStepper extends StatelessWidget {
  final int step;
  const RetrieveAccountStepper({
    Key? key,
    required this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget stepPoint({
      required int step,
      required double opacity,
      required Color stepColor,
      required Color textColor,
    }) {
      return ClipOval(
        child: SizedBox(
          width: 35,
          height: 35,
          child: Material(
            color: stepColor.withOpacity(opacity),
            child: Center(
              child: Text(
                step.toString(),
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget stepPointBlank() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(
            width: 3,
            color: Colors.grey.withOpacity(0.2),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        width: 18,
        height: 18,
      );
    }

    Widget stepLine({required Color lineColor, required double opacity}) {
      return SizedBox(
        width: 35,
        height: 3,
        child: Material(color: lineColor.withOpacity(opacity)),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        stepPoint(
          step: 1,
          opacity: 1,
          stepColor: ColorsConstants.primaryColor,
          textColor: Colors.white,
        ),
        stepLine(
          lineColor: ColorsConstants.primaryColor,
          opacity: 1,
        ),
        stepPointBlank(),
        stepLine(
          lineColor: ColorsConstants.primaryColor,
          opacity: 1,
        ),
        Builder(builder: (context) {
          if (step == 0) {
            return stepPoint(
              step: 2,
              opacity: 1,
              stepColor: Colors.grey.shade300,
              textColor: ColorsConstants.primaryColor,
            );
          }
          return stepPoint(
            step: 2,
            opacity: 0.6,
            stepColor: ColorsConstants.primaryColor,
            textColor: Colors.white,
          );
        }),
        Builder(builder: (context) {
          if (step == 0) {
            return stepLine(
              lineColor: Colors.grey.shade300,
              opacity: 1,
            );
          }
          return stepLine(
            lineColor: ColorsConstants.primaryColor,
            opacity: 0.9,
          );
        }),
        stepPointBlank(),
        Builder(builder: (context) {
          if (step == 2) {
            return stepLine(
              lineColor: ColorsConstants.primaryColor,
              opacity: 0.6,
            );
          }
          return stepLine(
            lineColor: Colors.grey.shade300,
            opacity: 1,
          );
        }),
        Builder(builder: (context) {
          if (step == 2) {
            return stepPoint(
              step: 3,
              opacity: 0.3,
              stepColor: ColorsConstants.primaryColor,
              textColor: Colors.white,
            );
          }
          return stepPoint(
            step: 3,
            opacity: 1,
            stepColor: Colors.grey.shade300,
            textColor: ColorsConstants.primaryColor,
          );
        }),
      ],
    );
  }
}
