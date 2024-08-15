import 'package:flutter/material.dart';
import 'package:tictactoe/core/constant/color/colors.dart';

class AppTheme {
  TextStyle get whiteTS => const TextStyle(color: whiteColor, fontSize: 16);
  TextStyle get blackTS => const TextStyle(color: blackColor, fontSize: 16);
  TextStyle get whiteBoldTS => const TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 16);
  TextStyle get blackBoldTS => const TextStyle(color: blackColor, fontWeight: FontWeight.bold, fontSize: 16);

  ThemeData get appTheme => ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: "Poppins",
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: whiteColor),
          backgroundColor: backgroundColor
        ),
      );
}
