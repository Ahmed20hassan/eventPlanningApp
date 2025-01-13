import 'package:flutter/material.dart';
import 'package:todo/screens/lets_go_screen.dart';
import 'package:todo/theme/dark_theme.dart';
import 'package:todo/theme/light_theme.dart';
import 'package:todo/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BaseTheme theme=LightTheme();
    BaseTheme darkTheme=DarkTheme();
    return MaterialApp(
      darkTheme: darkTheme.themeData,
      theme: theme.themeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: IntroductionScreen.routname,
      routes: {
        IntroductionScreen.routname:(context)=>IntroductionScreen()
      },
    );
  }
}

