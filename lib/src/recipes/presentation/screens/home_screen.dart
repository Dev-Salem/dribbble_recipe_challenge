import 'package:dribbble_challenge/src/core/widget/annotated_scaffold.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/animated_avatar_widget.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/animated_category_list.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/animated_name_widget.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/animated_selected_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return AnnotatedScaffold(
        //assetPath: "assets/images/home_screen.png",
        child: LayoutBuilder(builder: (context, constraints) {
      final avatarPlayDuration = 500.ms;
      final avatarWaitingDuration = 400.ms;
      final nameDelayDuration =
          avatarWaitingDuration + avatarWaitingDuration + 200.ms;
      final namePlayDuration = 800.ms;
      final categoryListPlayDuration = 750.ms;
      final categoryListDelayDuration =
          nameDelayDuration + namePlayDuration - 400.ms;
      final selectedCategoryPlayDuration = 400.ms;
      final selectedCategoryDelayDuration =
          categoryListDelayDuration + categoryListPlayDuration;
      return Stack(
        children: [
          AnimatedAvatarWidget(
            constraints: constraints,
            avatarWaitingDuration: avatarWaitingDuration,
            avatarPlayDuration: avatarPlayDuration,
          ),
          AnimatedNameWidget(
            constraints: constraints,
            namePlayDuration: namePlayDuration,
            nameDelayDuration: nameDelayDuration,
          ),
          AnimatedCategoryList(
            constraints: constraints,
            categoryListPlayDuration: categoryListPlayDuration,
            categoryListDelayDuration: categoryListDelayDuration,
          ),
          AnimatedSelectedCategoryWidget(
            constraints: constraints,
            selectedCategoryPlayDuration: selectedCategoryPlayDuration,
            selectedCategoryDelayDuration: selectedCategoryDelayDuration,
          )
        ],
      );
    }));
  }
}
