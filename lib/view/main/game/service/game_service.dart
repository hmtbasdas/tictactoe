import 'package:tictactoe/core/constant/enum/firebase_storage_col_enum.dart';
import 'package:tictactoe/core/manager/manager.dart';
import 'package:tictactoe/product/model/game_model.dart';
import 'package:tictactoe/view/main/game/service/igame_service.dart';

class GameService implements IGameService {
  /// oyun oluştur. Öneri: [player1DisplayName] - [player2DisplayName] alanlarıı [Users] Collection üzerinden çekilebilirdi
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

  /// oyuna katılmak isteyen kullanıcı bu servisi kullanır
  @override
  Future<void> playGame(String gameName) async {
    try {
      /// doc [gameName] regex
      await Manager.instance.managerModel.firestore.collection(FSCollectionEnum.Games.name).doc(gameName.replaceAll(RegExp(r"\s+"), "")).update(
        {
          "isGameStart": true,
          "player2UID": Manager.instance.managerModel.user!.uid,
          "player2DisplayName": Manager.instance.managerModel.user!.displayName,
        },
      );
    } catch (_) {}
  }

  /// oyun sonu veya oyunu oluşturan kullanıcı çalışan fonksiyondur
  @override
  Future<void> deleteGame(String gameName) async {
    try {
      await deletePlayground(gameName);
      await Manager.instance.managerModel.firestore.collection(FSCollectionEnum.Games.name).doc(gameName.replaceAll(RegExp(r"\s+"), "")).delete();
    } catch (_) {}
  }

  /// oyuncuların tahta üzerindeki yaptığı hamlelerde kullanılan fonksiyondur
  @override
  Future<String?> tapPlayground(GameModel gameModel, int boxIndex) async {
    try {
      var moveList = await Manager.instance.managerModel.firestore
          .collection(FSCollectionEnum.Games.name)
          .doc(gameModel.gameName!.replaceAll(RegExp(r"\s+"), ""))
          .collection(FSCollectionEnum.Playground.name)
          .get();

      if (moveList.docs.isEmpty && gameModel.player1UID == Manager.instance.managerModel.user!.uid) {
        await sendTap(gameModel, boxIndex, moveList.size, gameModel.player1UID);
      } else {
        if (moveList.docs.last.data()["playerUID"] != Manager.instance.managerModel.user!.uid) {
          await sendTap(gameModel, boxIndex, moveList.size, Manager.instance.managerModel.user!.uid);
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

  /// oyuncuların hamlelerini firebasefirestore'a kaydeder
  Future<void> sendTap(GameModel gameModel, int boxIndex, int moveNumber, playerUID) async {
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

  /// beraberlik durumunda move geçmişi buradan silinir
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
