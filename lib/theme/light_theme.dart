import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/theme/theme.dart';

class LightTheme extends BaseTheme{
  @override
  // TODO: implement backgroundcolor
  Color get backgroundcolor => Color(0xFFF2FEFF);

  @override
  // TODO: implement primarycolor
  Color get primarycolor => Color(0xFF5669FF);

  @override
  // TODO: implement textcolor
  Color get textcolor => Color(0xFF1C1C1C);

  @override
  // TODO: implement themeData
  ThemeData get themeData => ThemeData(

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primarycolor,

      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(
          color: Colors.white,
          width: 4
        )
      )
    ),
    focusColor: Color(0xFF7B7B7B),
    hintColor: backgroundcolor,
    dividerColor: textcolor,
    primaryColor: primarycolor,
    scaffoldBackgroundColor: backgroundcolor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primarycolor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,

    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundcolor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color:primarycolor
      ),
    ),

    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: textcolor,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primarycolor,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: primarycolor,
      ),
    )
  );
  
}