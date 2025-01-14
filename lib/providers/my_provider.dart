import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  ThemeMode themeMode=ThemeMode.light;
  void ChangTheme(){
    if(themeMode==ThemeMode.light){
      themeMode=ThemeMode.dark;
    }else{
      themeMode=ThemeMode.light;
    }
    notifyListeners();
  }

}