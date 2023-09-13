// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dribbble_challenge/src/core/widget/annotated_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class PixelPerfectScaffold extends StatelessWidget {
  final Widget child;
  final String assetPath;
  const PixelPerfectScaffold({
    Key? key,
    required this.child,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PixelPerfect(
        assetPath: assetPath,
        scale: 1.65,
        child: AnnotatedScaffold(child: child));
  }
}
