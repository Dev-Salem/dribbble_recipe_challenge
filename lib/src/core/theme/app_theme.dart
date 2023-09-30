import 'package:dribbble_challenge/src/core/theme/app_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final mainTheme = FlexThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    textTheme: const TextTheme().copyWith(
      bodyLarge: const TextStyle(
        color: Colors.black,
        height: 1.4,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
      bodySmall: const TextStyle(fontSize: 14, color: Colors.white60),
      headlineMedium:
          const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      titleMedium: const TextStyle(
          color: Colors.white,
          height: 1.4,
          fontSize: 17,
          fontWeight: FontWeight.w700),
      titleLarge: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
      displaySmall: const TextStyle(
        fontSize: 36,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(fontSize: 12, color: Colors.amber.shade100),
      labelLarge: const TextStyle(
          fontSize: 12, color: Colors.white60, fontWeight: FontWeight.w400),
    ),
    cardTheme: CardTheme(
        color: AppColors.cardColor,
        elevation: 0,
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
