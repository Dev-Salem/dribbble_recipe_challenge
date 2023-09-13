// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedAvatarWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const AnimatedAvatarWidget({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: constraints.maxHeight * 0.25,
      left: constraints.maxWidth * 0.45,
      child: const CircleAvatar(
        radius: 18,
        backgroundColor: Colors.white,
      )
          .animate()
          .scaleXY(
              begin: 0, end: 2, duration: 500.ms, curve: Curves.fastOutSlowIn)
          .then(delay: 400.ms)
          .scaleXY(begin: 3, end: 0.8)
          .slide(begin: Offset.zero, end: const Offset(4.1, -5)),
    );
  }
}
