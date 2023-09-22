import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const double kHeaderTextSize1 = 28;
const double kHeaderTextSize2 = 23;
const double kBodyTextSize1 = 16;
const double kBodyTextSize2 = 14;
const double kBodyTextSize3 = 12;

class AppTheme {
  static const Color accentColor = Color(0xFF2B60E8);
  static const double iconSize = 40;

  static const Color darkBackgroundColor = Color(0xFF121212);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(fontSize: kHeaderTextSize1, color: Colors.black),
      displayMedium: GoogleFonts.poppins(fontSize: kHeaderTextSize2, color: Colors.black),
      bodyLarge: GoogleFonts.poppins(fontSize: kBodyTextSize1, color: Colors.black),
      bodyMedium: GoogleFonts.poppins(fontSize: kBodyTextSize2, color: Colors.black),
      bodySmall: GoogleFonts.poppins(fontSize: kBodyTextSize3, color: Colors.black),
    ),
    iconTheme: const IconThemeData(
      color: accentColor,
      // size: iconSize,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: accentColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkBackgroundColor,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackgroundColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(fontSize: kHeaderTextSize1, color: Colors.white),
      displayMedium: GoogleFonts.poppins(fontSize: kHeaderTextSize2, color: Colors.white),
      bodyLarge: GoogleFonts.poppins(fontSize: kBodyTextSize1, color: Colors.white),
      bodyMedium: GoogleFonts.poppins(fontSize: kBodyTextSize2, color: Colors.white),
      bodySmall: GoogleFonts.poppins(fontSize: kBodyTextSize3, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: accentColor,
      // size: iconSize,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: accentColor,
    ),
  );
}
