import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/theme/theme.dart';

class DarkTheme extends BaseTheme{
  @override
  // TODO: implement backgroundcolor
  Color get backgroundcolor => Color(0xFF101127);

  @override
  // TODO: implement primarycolor
  Color get primarycolor => Color(0xFF5669FF);

  @override
  // TODO: implement textcolor
  Color get textcolor => Color(0xFFF4EBDC);

  @override
  // TODO: implement themeData
  ThemeData get themeData =>  ThemeData(
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
      focusColor:primarycolor,
      hintColor: backgroundcolor,
      primaryColor: primarycolor,
      scaffoldBackgroundColor: backgroundcolor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: backgroundcolor,
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