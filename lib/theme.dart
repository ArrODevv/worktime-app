import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF279655))
);

ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1E7744))
);
