import 'package:flutter/material.dart';
import 'package:tictactoe/core/base/view/base_view.dart';
import 'package:tictactoe/core/constant/image/image_constant.dart';
import 'package:tictactoe/core/constant/strings/strings.dart';
import 'package:tictactoe/core/init/theme/app_theme.dart';
import 'package:tictactoe/product/widget/custom_indicator.dart';
import 'package:tictactoe/product/widget/intro_widget.dart';
import 'package:tictactoe/view/auth/splash/view-model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) => buildView(context, viewModel),
    );
  }

  Widget buildView(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IntroWidget(viewModel: viewModel),
              const SizedBox(height: 16),
              const CustomIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
