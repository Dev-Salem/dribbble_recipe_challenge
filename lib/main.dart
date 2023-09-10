import 'package:dribbble_challenge/src/onboarding/onboarding_screen.dart';
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
      home: const OnBoardingScreen(),
      theme: FlexThemeData.light(scheme: FlexScheme.ebonyClay),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.ebonyClay)
      //.copyWith(textTheme: GoogleFonts.ubuntuTextTheme())
      ,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
