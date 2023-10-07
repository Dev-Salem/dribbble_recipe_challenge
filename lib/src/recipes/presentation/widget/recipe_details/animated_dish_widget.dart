// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedDishWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final String imageUrl;
  final Duration dishPlayTime;
  const AnimatedDishWidget({
    Key? key,
    required this.constraints,
    required this.imageUrl,
    required this.dishPlayTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight * 0.31,
      width: constraints.maxWidth * 0.8,
      alignment: Alignment.center,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.contain,
      )
          .animate()
          .scaleXY(
              begin: 0.0,
              end: 1.0,
              duration: dishPlayTime,
              curve: Curves.decelerate)
          .fadeIn()
          .blurXY(begin: 10, end: 0),
    );
  }
}
