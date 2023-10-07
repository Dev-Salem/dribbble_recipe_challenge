import 'package:dribbble_challenge/src/core/widget/annotated_scaffold.dart';
import 'package:dribbble_challenge/src/recipes/presentation/widget/home_screen/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showRecipeList = false;
  void changeListVisibility() {
    setState(() {
      _showRecipeList = true;
    });
  }

  @override
  void initState() {
    Future.delayed(2550.ms, () => changeListVisibility());
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return AnnotatedScaffold(
        // assetPath: "assets/images/home_screen.png",
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
          ),
          Positioned.fill(
              top: constraints.maxHeight * 0.30,
              child: _showRecipeList
                  ? AnimatedRecipesWidget(
                      constraints: constraints,
                    )
                  : const SizedBox())
        ],
      );
    }));
  }
}
