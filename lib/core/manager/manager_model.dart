import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/core/constant/navigation/navigation_constant.dart';
import 'package:tictactoe/core/init/navigation/navigation_service.dart';
import 'package:tictactoe/product/model/game_board_model.dart';
import 'package:tictactoe/product/model/game_model.dart';

part 'manager_model.g.dart';

class ManagerModel = _ManagerModelBase with _$ManagerModel;

abstract class _ManagerModelBase with Store {

  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? user;

  @observable
  List<GameModel> gameList = [];
  @observable
  GameListStatus gameListStatus = GameListStatus.ready;

  List<GameBoardModel> gameBoardType = [
    GameBoardModel("3 X 3", 3),
    GameBoardModel("4 X 4", 4),
    GameBoardModel("5 X 5", 5),
  ];

  @action
  void updateGameList(GameModel newGameModel, DocumentChangeType type) {
    gameListStatus = GameListStatus.loading;

    int index = gameList.indexWhere((game) => game.gameName == newGameModel.gameName);
    if(type == DocumentChangeType.added && newGameModel.isGameStart == false){
      gameList.add(newGameModel);
    }
    if(type == DocumentChangeType.modified) {
      if(newGameModel.player1UID == user!.uid && newGameModel.player2UID!.isNotEmpty) {
        NavigationService.instance.navigateToPage(path: NavigationConstant.playground, data: newGameModel);
      }
    }

    if(type == DocumentChangeType.removed){
      gameList.removeAt(index);
    }

    gameListStatus = GameListStatus.ready;
  }
}

enum GameListStatus { loading, ready }
