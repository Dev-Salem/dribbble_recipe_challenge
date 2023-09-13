import 'package:dribbble_challenge/src/core/widget/annotated_scaffold.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/animated_avatar_widget.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/animated_name_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedScaffold(
        //assetPath: "assets/images/home_screen.png",
        child: LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          AnimatedAvatarWidget(constraints: constraints),
          const AnimatedNameWidget(),
        ],
      );
    }));
  }
}
