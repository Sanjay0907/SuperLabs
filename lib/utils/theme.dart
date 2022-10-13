import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superlabs/utils/colors.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: white,
  appBarTheme: AppBarTheme(
    color: white,
  ),
  textTheme: TextTheme(
    headline1: GoogleFonts.roboto(
      fontSize: 42,
      fontWeight: FontWeight.bold,
      color: greenShade,
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: greenShade,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: greenShade,
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: greenShade,
    ),
    headline5: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: greenShade,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: greenShade,
    ),
    subtitle1: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: greenShade,
    ),
    subtitle2: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: greenShade,
    ),
    bodyText1: GoogleFonts.roboto(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: greenShade,
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: greenShade,
    ),
    button: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: greenShade,
    ),
  ),
);
