import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/core/base/model/base_model.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/view/main/game/service/game_service.dart';
import 'package:tictactoe/view/main/game/service/igame_service.dart';

part 'create_game_view_model.g.dart';

class CreateGameViewModel = _CreateGameViewModelBase with _$CreateGameViewModel;

abstract class _CreateGameViewModelBase with Store, BaseModel {
  late IGameService gameService;

  TextEditingController gameNameTextEditingController = TextEditingController();

  @observable
  int selectedGameBoardType = 3;

  @observable
  int selectedGameBoardColorIndex = 0;

  @override
  void setContext(BuildContext context) {
    mContext = context;
    gameService = GameService();
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

  Future<void> createGame() async {
    bool result = await gameService.createGame(gameNameTextEditingController.text, selectedGameBoardType, selectedGameBoardColorIndex);
    result ? Navigator.pop(mContext!) : customSnackBar.showCustomSnackBar(errorColor, "Something went wrong!");
  }

  void validation() async {
    gameNameTextEditingController.text.isNotEmpty ?
    await createGame() :
    customSnackBar.showCustomSnackBar(errorColor, "Please give a name for game!");
  }

  @action
  void changeGameBoardColor(int index) {
    selectedGameBoardColorIndex = index;
  }

  @action
  void changeGameBoardType(int index) {
    selectedGameBoardType = index;
  }
}
