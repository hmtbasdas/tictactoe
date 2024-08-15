import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/core/base/model/base_model.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/core/constant/navigation/navigation_constant.dart';
import 'package:tictactoe/core/manager/manager.dart';
import 'package:tictactoe/product/model/user_model.dart';
import 'package:tictactoe/view/auth/service/auth_service.dart';
import 'package:tictactoe/view/auth/service/iauth_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseModel {
  late IAuthService authService;

  TextEditingController usernameTextEditingController = TextEditingController();

  @observable
  LoginButtonStatus loginButtonStatus = LoginButtonStatus.ready;

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
    loginButtonStatus = LoginButtonStatus.busy;
    User? user = await authService.anonymousLogin(usernameTextEditingController.text);
    if(user != null) {
      Manager.instance.managerModel.user = user;
      navigation.navigateToPageClear(path: NavigationConstant.home);
    }
    else {
      customSnackBar.showCustomSnackBar(errorColor, "Something went wrong!");
    }
    loginButtonStatus = LoginButtonStatus.ready;
  }

  validate() async {
    usernameTextEditingController.text.isNotEmpty ?
    await anonymousLogin() :
    customSnackBar.showCustomSnackBar(errorColor, "username field can't be empty!");
  }
}

enum LoginButtonStatus { ready, busy }
