import 'package:tictactoe/core/constant/enum/firebase_storage_col_enum.dart';
import 'package:tictactoe/core/manager/manager.dart';
import 'package:tictactoe/product/model/game_model.dart';
import 'package:tictactoe/view/main/game/service/igame_service.dart';

class GameService implements IGameService {
  @override
  Future<bool> createGame(String gameName, int gameBoardType, int gameBoardColorIndex) async {
    try {
      await Manager.instance.managerModel.firestore.collection(FSCollectionEnum.Games.name).doc(gameName.replaceAll(RegExp(r"\s+"), "")).set({
        "gameName": gameName,
        "gameBoardType": gameBoardType,
        "gameBoardColorIndex": gameBoardColorIndex,
        "isGameStart": false,
        "player1UID": Manager.instance.managerModel.user!.uid,
        "player1DisplayName": Manager.instance.managerModel.user!.displayName,
        "player2UID": "",
        "player2DisplayName": ""
      });
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> playGame(String gameName) async {
    try {
      await Manager.instance.managerModel.firestore
          .collection(FSCollectionEnum.Games.name)
          .doc(gameName.replaceAll(RegExp(r"\s+"), ""))
          .update({"isGameStart": true, "player2UID": Manager.instance.managerModel.user!.uid, "player2DisplayName": Manager.instance.managerModel.user!.displayName});
    } catch (_) {}
  }

  @override
  Future<void> deleteGame(String gameName) async {
    try {
      await deletePlayground(gameName);
      await Manager.instance.managerModel.firestore.collection(FSCollectionEnum.Games.name).doc(gameName.replaceAll(RegExp(r"\s+"), "")).delete();
    } catch (_) {}
  }

  @override
  Future<String?> tapPlayground(GameModel gameModel, int boxIndex) async {
    try {
      var moveList = await Manager.instance.managerModel.firestore
          .collection(FSCollectionEnum.Games.name)
          .doc(gameModel.gameName!.replaceAll(RegExp(r"\s+"), ""))
          .collection(FSCollectionEnum.Playground.name)
          .get();

      if (moveList.docs.isEmpty && gameModel.player1UID == Manager.instance.managerModel.user!.uid) {
        sendTap(gameModel, boxIndex, moveList.size, gameModel.player1UID);
      } else {
        if (moveList.docs.last.data()["playerUID"] != Manager.instance.managerModel.user!.uid) {
          sendTap(gameModel, boxIndex, moveList.size, Manager.instance.managerModel.user!.uid);
        } else {
          return "Not your turn!";
        }
      }
    } catch (error) {
      // that is means there is not Playground collection
      return error.toString() == "Bad state: No element" ? "You're not the first player" : "Something went wrong!";
    }
    return null;
  }

  void sendTap(GameModel gameModel, int boxIndex, int moveNumber, playerUID) async {
    await Manager.instance.managerModel.firestore
        .collection(FSCollectionEnum.Games.name)
        .doc(gameModel.gameName!.replaceAll(RegExp(r"\s+"), ""))
        .collection(FSCollectionEnum.Playground.name)
        .doc((moveNumber + 10).toString())
        .set(
      {
        "boxIndex": boxIndex,
        "type": gameModel.player1UID == Manager.instance.managerModel.user!.uid ? "X" : "O",
        "playerUID": playerUID,
      },
    );
  }

  @override
  Future<void> deletePlayground(String gameName) async {
    try {
      var moveList = await Manager.instance.managerModel.firestore
          .collection(FSCollectionEnum.Games.name)
          .doc(gameName.replaceAll(RegExp(r"\s+"), ""))
          .collection(FSCollectionEnum.Playground.name)
          .get();

      for (var move in moveList.docs) {
        await move.reference.delete();
      }
    } catch (_) {}
  }
}
