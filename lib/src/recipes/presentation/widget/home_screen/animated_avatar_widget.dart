// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedAvatarWidget extends StatelessWidget {
  final Duration avatarPlayDuration;
  final Duration avatarWaitingDuration;
  final BoxConstraints constraints;
  const AnimatedAvatarWidget({
    Key? key,
    required this.avatarPlayDuration,
    required this.avatarWaitingDuration,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 215,
      left: constraints.maxWidth * 0.45,
      child: const CircleAvatar(
        radius: 18,
        backgroundColor: Colors.white,
      )
          .animate()
          .scaleXY(
              begin: 0,
              end: 2,
              duration: avatarPlayDuration,
              curve: Curves.easeInOutSine)
          .then(delay: avatarWaitingDuration)
          .scaleXY(begin: 3, end: 1)
          .slide(begin: Offset.zero, end: const Offset(4.1, -5)),
    );
  }
}
