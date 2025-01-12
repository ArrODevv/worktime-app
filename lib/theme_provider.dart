import 'package:flutter/material.dart';
import 'package:worktime/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = darkTheme;
  
  ThemeData get themeData => _themeData;
  
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
  
  void toggleTheme() {
    if(_themeData == darkTheme) {
      themeData = lightTheme;
    } else {
      themeData = darkTheme;
    }
  }
}
