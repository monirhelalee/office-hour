import 'package:flutter/material.dart';

class TextStyles {
  static Color color = const Color(0xff1a202c);

  //headline
  static TextStyle headlineLarge = TextStyle(
    color: color,
    fontSize: 48,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headlineMedium = headlineLarge.copyWith(
    fontSize: 40,
  );

  static TextStyle headlineSmall = headlineLarge.copyWith(
    fontSize: 32,
  );

  //display
  static TextStyle displayLarge = headlineSmall.copyWith(
    fontSize: 24,
  );

  static TextStyle displayMedium = displayLarge.copyWith(
    fontSize: 20,
  );

  static TextStyle displaySmall = displayLarge.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  // label
  static TextStyle labelLarge = displaySmall.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static TextStyle labelMedium = labelLarge.copyWith(
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelSmall = labelMedium.copyWith(
    fontWeight: FontWeight.w400,
  );

  //title
  static TextStyle titleLarge = labelSmall.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleMedium = titleLarge.copyWith(
    fontSize: 12,
  );

  static TextStyle titleSmall = titleMedium.copyWith(
    fontSize: 10,
  );

  //body
  static TextStyle bodyLarge = titleLarge.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodyMedium = bodyLarge.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodySmall = bodyLarge.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
}
