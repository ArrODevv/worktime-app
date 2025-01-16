import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(MaterialApp(
    title: 'Worktime',
    darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFABCDEF)),
    ),
    themeMode: ThemeMode.dark,
    home: const WorktimeApp(),
  ));
}
