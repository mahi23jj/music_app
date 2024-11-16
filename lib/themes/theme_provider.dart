import 'package:flutter/material.dart';

class themes extends ChangeNotifier {
  ThemeData themeData = ThemeData.light();
  bool isDark = false;

  void changeTheme() {
    if (isDark) {
      themeData = ThemeData.light();
      isDark = false;
    } else {
      themeData = ThemeData.dark();
      isDark = true;
    }
    notifyListeners();
  }

}
