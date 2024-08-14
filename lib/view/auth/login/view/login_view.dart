import 'package:flutter/material.dart';
import 'package:tictactoe/core/base/view/base_view.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/core/constant/image/image_constant.dart';
import 'package:tictactoe/core/constant/strings/strings.dart';
import 'package:tictactoe/core/init/theme/app_theme.dart';
import 'package:tictactoe/product/widget/custom_indicator.dart';
import 'package:tictactoe/product/widget/default_padding.dart';
import 'package:tictactoe/product/widget/intro_widget.dart';
import 'package:tictactoe/view/auth/login/view-model/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) => buildView(context, viewModel),
    );
  }

  Widget buildView(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: DefaultPadding(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IntroWidget(viewModel: viewModel),
              const SizedBox(height: 36),
              login(viewModel, context),
              SizedBox(height: viewModel.dynamicHeight(context, .12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget login(LoginViewModel viewModel, BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: viewModel.usernameTextEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(999),
            ),
            constraints: const BoxConstraints(maxHeight: 50),
            hintText: Strings.loginTFFHintText,
            filled: true,
            isDense: true,
            isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
            fillColor: whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: viewModel.validate,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(greenColor),
            fixedSize: MaterialStateProperty.all(Size(viewModel.dynamicWidth(context, 1), 50)),
          ),
          child: Text(
            Strings.login,
            maxLines: 1,
            style: AppTheme().whiteBoldTS.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
