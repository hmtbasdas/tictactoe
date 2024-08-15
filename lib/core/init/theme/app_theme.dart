import 'package:flutter/material.dart';
import 'package:tictactoe/core/constant/color/colors.dart';

class AppTheme {
  TextStyle get whiteTS => const TextStyle(color: Colors.white, fontSize: 16);
  TextStyle get whiteBoldTS => const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

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
