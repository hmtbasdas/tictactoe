import 'package:tictactoe/core/constant/enum/firebase_storage_col_enum.dart';
import 'package:tictactoe/core/manager/manager.dart';
import 'package:tictactoe/view/main/game/service/igame_service.dart';

class GameService implements IGameService {
  @override
  Future<bool> createGame(String gameName, int gameBoardColorIndex) async {
    try {
      await Manager.instance.managerModel.firestore.collection(FSCollectionEnum.Games.name).doc(gameName.replaceAll(RegExp(r"\s+"), "")).set(
          {
            "gameName": gameName,
            "gameBoardColorIndex": gameBoardColorIndex,
            "isGameStart": false,
            "player1UID": Manager.instance.managerModel.user!.uid,
            "player1DisplayName": Manager.instance.managerModel.user!.displayName,
            "player2UID": "",
            "player2DisplayName": ""
          }
      );
      return true;
    }
    catch (_) {
      return false;
    }
  }

  @override
  Future<void> playGame(String gameName) async {
    try {
      await Manager.instance.managerModel.firestore.collection(FSCollectionEnum.Games.name).doc(gameName.replaceAll(RegExp(r"\s+"), "")).update(
          {
            "isGameStart": true,
            "player2UID": Manager.instance.managerModel.user!.uid,
            "player2DisplayName": Manager.instance.managerModel.user!.displayName
          }
      );
    }
    catch (_) {}
  }

  @override
  Future<void> deleteGame(String gameName) async {
    try {
      await Manager.instance.managerModel.firestore.collection(FSCollectionEnum.Games.name).doc(gameName.replaceAll(RegExp(r"\s+"), "")).delete();
    }
    catch (_) {}
  }
}