import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/core/base/model/base_model.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/core/manager/manager.dart';
import 'package:tictactoe/product/model/game_model.dart';
import 'package:tictactoe/product/model/game_move_model.dart';
import 'package:tictactoe/view/main/game/service/game_service.dart';
import 'package:tictactoe/view/main/game/service/igame_service.dart';

part 'playground_view_model.g.dart';

class PlaygroundViewModel = _PlaygroundViewModelBase with _$PlaygroundViewModel;

abstract class _PlaygroundViewModelBase with Store, BaseModel {
  late GameModel gameModel;
  late IGameService gameService;

  @observable
  List<GameMoveModel> gameMoveList = [];

  @observable
  GameMoveStatus gameMoveStatus = GameMoveStatus.waiting;

  @observable
  GameStatus gameStatus = GameStatus.notFinished;

  List<List<int>> conditionsToWinList3x3 = [
    // horizontal
    [0, 1, 2], [3, 4, 5], [6, 7, 8],

    // vertical
    [0, 3, 6], [1, 4, 7], [2, 5, 8],

    // diagonal
    [0, 4, 8], [2, 4, 6]
  ];

  List<List<int>> conditionsToWinList4x4 = [
    // horizontal
    [0, 1, 2], [1, 2, 3],
    [4, 5, 6], [5, 6, 7],
    [8, 9, 10], [9, 10, 11],
    [12, 13, 14], [13, 14, 15],

    // vertical
    [0, 4, 8], [4, 8, 12],
    [1, 5, 9], [5, 9, 13],
    [2, 6, 10], [6, 10, 14],
    [3, 7, 11], [7, 11, 15],

    // diagonal
    [0, 5, 10], [4, 9, 14], [8, 13, 15],
    [2, 5, 8], [6, 9, 12], [10, 13, 15],
  ];

  List<List<int>> conditionsToWinList5x5 = [
    // horizontal
    [0, 1, 2], [1, 2, 3], [2, 3, 4],
    [5, 6, 7], [6, 7, 8], [7, 8, 9],
    [10, 11, 12], [11, 12, 13], [12, 13, 14],
    [15, 16, 17], [16, 17, 18], [17, 18, 19],
    [20, 21, 22], [21, 22, 23], [22, 23, 24],

    // vertical
    [0, 5, 10], [5, 10, 15], [10, 15, 20],
    [1, 6, 11], [6, 11, 16], [11, 16, 21],
    [2, 7, 12], [7, 12, 17], [12, 17, 22],
    [3, 8, 13], [8, 13, 18], [13, 18, 23],
    [4, 9, 14], [9, 14, 19], [14, 19, 24],

    // diagonal
    [0, 6, 12], [5, 11, 17], [10, 16, 22],
    [1, 7, 13], [6, 12, 18], [11, 17, 23],
    [2, 8, 14], [7, 13, 19], [12, 18, 24],

    [4, 8, 12], [9, 13, 17], [14, 18, 22],
    [3, 7, 11], [8, 12, 16], [13, 17, 21],
    [2, 6, 10], [7, 11, 15], [12, 16, 20],
  ];

  Map<int, List<List<int>>> winConditions = {};

  @override
  void setContext(BuildContext context) {
    mContext = context;
    gameService = GameService();
  }

  @override
  void init() {
    winConditions = {3: conditionsToWinList3x3, 4: conditionsToWinList4x4, 5: conditionsToWinList5x5};
  }

  void setGameModel(GameModel gameModel) {
    this.gameModel = gameModel;
    firestoreStream.listenPlayground(gameModel.gameName!, listenMoves);
  }

  @override
  double dynamicWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  @override
  double dynamicHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }

  void tap(GameModel gameModel, int boxIndex) async {
    String? result = await gameService.tapPlayground(gameModel, boxIndex);
    if (result != null) {
      customSnackBar.showCustomSnackBar(errorColor, result);
    }
  }

  @action
  Future<void> listenMoves(data, type) async {
    gameMoveStatus = GameMoveStatus.moved;
    if (type == DocumentChangeType.added) {
      gameMoveList.add(GameMoveModel.to(data));

      for (var conditions in winConditions[gameModel.gameBoardType]!) {
        if (conditions.every((index) => gameMoveList.any((move) => move.boxIndex == index && move.type == 'X'))) {
          showWinner(GameMoveModel.to(data));
        }
        if (conditions.every((index) => gameMoveList.any((move) => move.boxIndex == index && move.type == 'O'))) {
          showWinner(GameMoveModel.to(data));
        }
      }
    }

    if (gameMoveList.length == gameModel.gameBoardType! * gameModel.gameBoardType!) {
      gameService.deletePlayground(gameModel.gameName!);
      gameMoveList = [];
    }
    gameMoveStatus = GameMoveStatus.waiting;
  }

  @action
  Future<void> showWinner(GameMoveModel gameMoveModel) async {
    gameStatus = GameStatus.finished;
    await gameService.deleteGame(gameModel.gameName!);
    showDialog<String>(
      context: mContext!,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          gameMoveModel.playerUID == Manager.instance.managerModel.user!.uid ? "You Win" : "You Lose",
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(mContext!);
              Navigator.pop(mContext!);
            },
            child: const Text("Go back to menu"),
          ),
        ],
      ),
    );
  }
}

enum GameMoveStatus { moved, waiting }

enum GameStatus { finished, notFinished }
