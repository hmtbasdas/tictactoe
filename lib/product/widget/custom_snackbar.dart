import 'package:flutter/material.dart';
import 'package:tictactoe/core/manager/manager.dart';

class CustomSnackBar {

  late final ScaffoldMessengerState _scaffold;
  CustomSnackBar() {
    _scaffold = Manager.instance.managerModel.scaffoldKey.currentState!;
  }

  showCustomSnackBar(Color backgroundColor, String message) {
    double snackBarSize = 60;
    _scaffold.showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        content: Container(
          height: snackBarSize,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          alignment: Alignment.center,
          child: Text(
            message,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}