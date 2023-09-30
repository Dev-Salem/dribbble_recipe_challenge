// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedInfoWidget extends StatelessWidget {
  final Map<String, num> nutrition;
  final Duration infoDelayTime;
  final Duration infoPlayTime;
  final BoxConstraints constraints;
  const AnimatedInfoWidget({
    Key? key,
    required this.nutrition,
    required this.infoDelayTime,
    required this.infoPlayTime,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight * 0.1,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white30, width: 1.3),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _InfoViewer(name: 'Kcal', amount: nutrition["calories"]!),
          _InfoViewer(name: 'Protein', amount: nutrition["protein"]!),
          _InfoViewer(name: 'Prep Time', amount: nutrition["prepTime"]!),
        ]
            .animate(interval: 200.ms, delay: infoDelayTime + 400.ms)
            .fadeIn(duration: infoPlayTime, curve: Curves.decelerate)
            .scaleXY(begin: 0, end: 1),
      ),
    ).animate(delay: infoDelayTime).fadeIn(curve: Curves.decelerate);
  }
}

class _InfoViewer extends StatelessWidget {
  final String name;
  final num amount;
  const _InfoViewer({
    Key? key,
    required this.name,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          amount.toString(),
          style:
              Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 18),
        ),
        Text(name, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
