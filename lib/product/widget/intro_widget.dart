import 'package:flutter/material.dart';
import 'package:tictactoe/core/constant/image/image_constant.dart';
import 'package:tictactoe/core/constant/strings/strings.dart';
import 'package:tictactoe/core/init/theme/app_theme.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({ required this.viewModel, super.key});

  final dynamic viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageFile.instance.toImage(ImageConstant.icon), width: viewModel.dynamicWidth(context, .3)),
        const SizedBox(height: 8),
        Text(Strings.appName, style: AppTheme().whiteBoldTS.copyWith(fontSize: 24)),
      ],
    );
  }
}
