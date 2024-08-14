import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/core/base/model/base_model.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/core/constant/navigation/navigation_constant.dart';
import 'package:tictactoe/view/auth/service/auth_service.dart';
import 'package:tictactoe/view/auth/service/iauth_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseModel {
  late IAuthService authService;

  TextEditingController usernameTextEditingController = TextEditingController();

  @override
  void setContext(BuildContext context) {
    mContext = context;
    authService = AuthService();
  }

  @override
  Future<void> init() async {}

  @override
  double dynamicWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  @override
  double dynamicHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }

  @action
  Future<void> anonymousLogin() async {
    bool result = await authService.anonymousLogin(usernameTextEditingController.text);
    result ?
    await navigation.navigateToPageClear(path: NavigationConstant.home) :
    customSnackBar.showCustomSnackBar(errorColor, "Something went wrong!");
  }

  validate() async {
    usernameTextEditingController.text.isNotEmpty ?
    await anonymousLogin() :
    customSnackBar.showCustomSnackBar(errorColor, "username field can't be empty!");
  }
}
