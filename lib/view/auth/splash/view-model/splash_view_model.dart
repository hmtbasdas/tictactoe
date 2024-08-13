import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/core/base/model/base_model.dart';
import 'package:tictactoe/core/constant/enum/storage_enum.dart';
import 'package:tictactoe/core/constant/navigation/navigation_constant.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseModel {

  @override
  void setContext(BuildContext context) {
    mContext = context;
  }

  @override
  Future<void> init() async {
    await autoLogin();
  }

  @override
  double dynamicWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  @override
  double dynamicHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }

  Future<void> autoLogin() async {
    if(!(await storageManager.checkStringValue(StorageEnum.authToken))) {
      navigation.navigateToPageClear(path: NavigationConstant.login);
    }
  }
}