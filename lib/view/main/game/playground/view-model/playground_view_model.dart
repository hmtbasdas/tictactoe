import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/core/base/model/base_model.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/view/auth/service/auth_service.dart';
import 'package:tictactoe/view/auth/service/iauth_service.dart';
import 'package:tictactoe/view/main/game/service/game_service.dart';
import 'package:tictactoe/view/main/game/service/igame_service.dart';

part 'playground_view_model.g.dart';

class PlaygroundViewModel = _PlaygroundViewModelBase with _$PlaygroundViewModel;

abstract class _PlaygroundViewModelBase with Store, BaseModel {

  @override
  void setContext(BuildContext context) {
    mContext = context;
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
}