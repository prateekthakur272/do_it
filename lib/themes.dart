import 'package:flutter/material.dart';

final themeLight = ThemeData.light(useMaterial3: true);
final themeDark = ThemeData.dark(useMaterial3: true);

class ThemeProvider with ChangeNotifier{
  ThemeData themeData = themeLight;
  bool isDark = false;
  void changeTheme(){
    if(themeData == themeLight){
      themeData = themeDark;
    }else{
      themeData = themeLight;
    }
    isDark = !isDark;
    notifyListeners();
  }
}