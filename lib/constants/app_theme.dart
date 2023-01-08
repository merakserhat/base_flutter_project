import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);

  static const Color primary = Color(0xff765c45);
  static const Color secondary = Color(0xfff7b500);

  static const Color iconColor = Color(0xff442f29);
}

class AppThemes {
  static final darkTheme = ThemeData(
    textTheme:
        getTextTheme(textColor: Colors.yellow, buttonColor: Colors.white),
    fontFamily: "Poppins",

    /*scaffoldBackgroundColor: ProgramColors.gloneraDarkBackground,
    fontFamily: "Poppins",
    primaryColor: ProgramColors.gloneraDarkMainGray,
    colorScheme: ColorScheme.dark(
        primary: ProgramColors.gloneraDarkMainGray,
        secondary: Colors.white70,
        onBackground: ProgramColors.gloneraDarkMainGray),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all<Color>(ProgramColors.gloneraDarkMainGray),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
      ),
    ),
    textButtonTheme:
    TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.white)),
    textTheme: getTextTheme(textColor: Colors.white, buttonColor: Colors.white),
    toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: Color(0xFF747474),
        color: ProgramColors.gloneraDarkMainGray,
        disabledColor: Colors.white),
    snackBarTheme:
    SnackBarThemeData(backgroundColor: ProgramColors.gloneraDarkMainGray),*/
  );

  static final lightTheme = ThemeData(
    textTheme: getTextTheme(
      textColor: Colors.black87,
      buttonColor: Colors.white,
    ),
    fontFamily: "Poppins",
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      onBackground: AppColors.white,
    ),
    iconTheme: const IconThemeData(color: AppColors.iconColor),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
    ),
  );

  static TextTheme getTextTheme(
      {required Color textColor, required Color buttonColor}) {
    return TextTheme(
      headline1: TextStyle(
          color: textColor, fontWeight: FontWeight.w500, fontSize: 18),
      headline2: TextStyle(
          color: textColor, fontWeight: FontWeight.w600, fontSize: 16),
      headline3: TextStyle(
          color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
      headline4: TextStyle(
          color: textColor, fontWeight: FontWeight.w600, fontSize: 14),
      headline5: TextStyle(
          color: textColor, fontWeight: FontWeight.w500, fontSize: 14),
      headline6: TextStyle(
          color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
      bodyText1: TextStyle(
          color: textColor, fontWeight: FontWeight.w400, fontSize: 12),
      bodyText2: TextStyle(
          color: textColor, fontWeight: FontWeight.normal, fontSize: 14),
      button: TextStyle(
          color: buttonColor, fontWeight: FontWeight.w500, fontSize: 12),
      overline: TextStyle(
          color: textColor,
          fontWeight: FontWeight.normal,
          fontSize: 9,
          letterSpacing: 0.1),
    );
  }
}
