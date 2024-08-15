import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/core/base/model/base_model.dart';
import 'package:tictactoe/core/constant/navigation/navigation_constant.dart';
import 'package:tictactoe/core/manager/manager.dart';
import 'package:tictactoe/view/auth/service/auth_service.dart';
import 'package:tictactoe/view/auth/service/iauth_service.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseModel {
  late IAuthService authService;

  @override
  void setContext(BuildContext context) {
    mContext = context;
  }

  @override
  void init() {
    authService = AuthService();
    // autoLogin öncesi sayfanın yüklenmesi için kullanıldı
    WidgetsBinding.instance.addPostFrameCallback((_) async { await autoLogin(); });
  }

  @override
  double dynamicWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  @override
  double dynamicHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }

  // firebaseAuth altında kullanıcı var ise direkt home'a yönlendirilir
  Future<void> autoLogin() async {
    User? user = await authService.autoLogin();
    if(user != null) {
      Manager.instance.managerModel.user = user;
      navigation.navigateToPageClear(path: NavigationConstant.home);
    }
    else {
      navigation.navigateToPageClear(path: NavigationConstant.login);
    }
  }
}