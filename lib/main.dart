import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(MaterialApp(
    title: 'Worktime',
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Color(0xFFEF682E),
      brightness: Brightness.dark,
    ),
    home: const WorktimeApp(),
  ));
}
