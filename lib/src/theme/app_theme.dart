import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shipment_app/src/core/constants/color_constants.dart';

const double kHeaderTextSize1 = 28;
const double kHeaderTextSize2 = 23;
const double kBodyTextSize1 = 16;
const double kBodyTextSize2 = 14;
const double kBodyTextSize3 = 12;

class AppTheme {
  static const double iconSize = 40;

  static const Color darkBackgroundColor = Color(0xFF121212);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: kBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(style: BorderStyle.none),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(style: BorderStyle.none),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(style: BorderStyle.none),
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
      color: kAccentColor,
      // size: iconSize,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: kAccentColor,
      unselectedItemColor: Color(0xFF97979c),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: kAccentColor,
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
      color: kAccentColor,
      // size: iconSize,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: kAccentColor,
    ),
  );
}
