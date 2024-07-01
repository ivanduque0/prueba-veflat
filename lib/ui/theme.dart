import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const Color primaryClr = Color.fromARGB(255, 11, 9, 124);
const Color primaryClr = Color.fromARGB(255, 239, 245, 245);
const Color dangerClr = Color.fromARGB(255, 226, 31, 31);
const Color primaryBackgroundClr = primaryClr;
const Color white = Colors.white;
const Color black = Colors.black;
const Color blue = Color.fromARGB(255, 33, 177, 243);
const Color pink = Color.fromARGB(255, 255, 121, 166);
const Color purple = Color.fromARGB(255, 237, 133, 255);
const Color darkGrey = Color(0xFF454545);
const Color lighterGrey = Color.fromARGB(255, 158, 158, 158);
const Color lightGrey = Color.fromARGB(255, 103, 103, 103);
const Color grey = Colors.grey;
const Color orange = Colors.orange;
const Color yelloStar = Color.fromARGB(255, 255, 200, 18);

class Themes {
  static final light = ThemeData(
    appBarTheme: const AppBarTheme(color: primaryClr),
    // primarySwatch: Colors.orange,
    // primaryColor: Colors.orange,
    // brightness: Brightness.light,
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange, onPrimary: Colors.orange),
    useMaterial3: false,
  );

  // static final dark = ThemeData(
  //   primaryColor: darkGreyClr,
  //   appBarTheme: AppBarTheme(
  //     color: darkGreyClr
  //   ),
  //   brightness: Brightness.dark,
  //   useMaterial3: true,
  // );
}

TextStyle get appBarStyle {
  return GoogleFonts.lato(textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: white));
}
TextStyle get cartCountStyle {
  return GoogleFonts.lato(textStyle: const TextStyle(fontSize: 10, height: 1.1, fontWeight: FontWeight.w600, color: white));
}

TextStyle get buttonTextStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 20,
    height: 1,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ));
}

TextStyle get productCardNameTextStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 17,
        height: 1,
        // fontWeight: FontWeight.w900,
        color: lightGrey));
}

TextStyle get productCardPriceTextStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 17,
        height: 1,
        fontWeight: FontWeight.w900,
        color: black));
}

TextStyle get titleTextStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 35,
        height: 1,
        fontWeight: FontWeight.w500,
        color: black));
}

TextStyle get productNameTextStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 27,
        height: 1,
        fontWeight: FontWeight.w900,
        color: black
        ));
}
TextStyle get productNameCartTextStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 23,
        height: 1,
        fontWeight: FontWeight.w600,
        color: black
        ));
}

TextStyle get productPriceTextStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 20,
        height: 1.1,
        fontWeight: FontWeight.w900,
        color: grey
        ));
}
TextStyle get productSubtitleTextStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 19,
        height: 1.1,
        fontWeight: FontWeight.w900,
        color: black
        ));
}
TextStyle get productSubtitleValueTextStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 18,
        height: 1.1,
        fontWeight: FontWeight.w400,
        color: black
        ));
}

TextStyle get titleAppBarTextStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 27,
        height: 1.1,
        fontWeight: FontWeight.w700,
        color: black
        ));
}

TextStyle get itemQuantityCartStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 18,
        height: 1.1,
        fontWeight: FontWeight.w700,
        color: black
        ));
}

TextStyle get leftTextCalculationStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 22,
        height: 1.1,
        fontWeight: FontWeight.w600,
        color: lightGrey
        ));
}

TextStyle get rightTextCalculationStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
        fontSize: 25,
        height: 1.1,
        fontWeight: FontWeight.w800,
        color: black
        ));
}







TextStyle get inputTextStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 20,
          height: 1,
          // fontWeight: FontWeight.w900,
          color: darkGrey));
}

TextStyle get registerTextStyle {
  return GoogleFonts.lato(textStyle: const TextStyle(fontSize: 20, height: 1, fontWeight: FontWeight.w600, color: primaryClr));
}

TextStyle get smallTextStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 14,
          height: 1,
          // fontWeight: FontWeight.w600,
          color: black));
}

TextStyle get snackbarTextStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 20,
          height: 1,
          // fontWeight: FontWeight.w600,
          color: white));
}

TextStyle get titleHomeTextStyle {
  return GoogleFonts.lato(textStyle: const TextStyle(fontSize: 15, height: 1, fontWeight: FontWeight.w400, color: darkGrey));
}

TextStyle get titleHomeTextBoldStyle {
  return GoogleFonts.lato(textStyle: const TextStyle(fontSize: 15, height: 1, fontWeight: FontWeight.bold, color: darkGrey));
}

TextStyle get subTitleTextStyle {
  return GoogleFonts.lato(textStyle: const TextStyle(fontSize: 20, height: 1, fontWeight: FontWeight.w600, color: black));
}

TextStyle get subTitleSmallerTextStyle {
  return GoogleFonts.lato(textStyle: const TextStyle(fontSize: 18, height: 1, fontWeight: FontWeight.w500, color: black));
}

TextStyle get serviceAppointmenCard {
  return GoogleFonts.lato(textStyle: const TextStyle(fontSize: 15, height: 1, fontWeight: FontWeight.w400, color: darkGrey));
}

TextStyle get advertisementTitle {
  return GoogleFonts.lato(textStyle: const TextStyle(fontSize: 20, height: 1, fontWeight: FontWeight.w700, color: white));
}

TextStyle get advertisementSubtitle {
  return GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, height: 1, fontWeight: FontWeight.w500, color: white));
}
