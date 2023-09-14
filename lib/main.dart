import 'package:dribbble_challenge/src/recipes/presentation/screens/home_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: DribbleChallenge()));
}

class DribbleChallenge extends StatelessWidget {
  const DribbleChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      onGenerateRoute: (settings) {
        return switch (settings.name) {
          '/' => MaterialPageRoute(builder: (_) => const HomeScreen()),
          _ => MaterialPageRoute(builder: (_) => const HomeScreen())
        };
      },
      theme: FlexThemeData.light(scheme: FlexScheme.ebonyClay),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.ebonyClay)
          .copyWith(scaffoldBackgroundColor: const Color(0xff101520)),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
