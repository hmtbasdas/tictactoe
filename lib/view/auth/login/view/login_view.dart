import 'package:flutter/material.dart';
import 'package:tictactoe/core/base/view/base_view.dart';
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
      body: Text("login"),
    );
  }
}
