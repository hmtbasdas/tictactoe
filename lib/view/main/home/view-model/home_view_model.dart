import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/core/base/model/base_model.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/core/constant/navigation/navigation_constant.dart';
import 'package:tictactoe/view/auth/service/auth_service.dart';
import 'package:tictactoe/view/auth/service/iauth_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseModel {
  late IAuthService authService;

  @override
  void setContext(BuildContext context) {
    mContext = context;
    authService = AuthService();
  }

  @override
  void init() {}

  @override
  double dynamicWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  @override
  double dynamicHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }

  Future<void> signOut() async {
    bool result = await authService.signOut();
    result ?
    navigation.navigateToPageClear(path: NavigationConstant.login) :
    customSnackBar.showCustomSnackBar(errorColor, "Something went wrong!");
  }

  void goCreateGameView() {
    navigation.navigateToPage(path: NavigationConstant.createGame);
  }
}