import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/core/base/model/base_model.dart';
import 'package:tictactoe/core/constant/color/colors.dart';

part 'create_game_view_model.g.dart';

class CreateGameViewModel = _CreateGameViewModelBase with _$CreateGameViewModel;

abstract class _CreateGameViewModelBase with Store, BaseModel {
  TextEditingController gameNameTextEditingController = TextEditingController();

  @observable
  int selectedGameBoardColorIndex = 0;

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

  Future<void> createGame() async {}

  void validation() async {
    gameNameTextEditingController.text.isNotEmpty ?
    await createGame() :
    customSnackBar.showCustomSnackBar(errorColor, "Please give a name for game!");
  }

  @action
  void changeGameBoardColor(int index) {
    selectedGameBoardColorIndex = index;
  }
}
