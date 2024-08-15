import 'package:flutter/material.dart';
import 'package:tictactoe/core/constant/color/colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({this.height = 24, this.width = 24, super.key});

  final double height, width;

  // custom indicator
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width, child: const CircularProgressIndicator(color: whiteColor, backgroundColor: backgroundColor));
  }
}
