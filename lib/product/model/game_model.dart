// oyun kurmak için kullanılan modeldir
class GameModel {
  String? gameName, player1UID, player1DisplayName, player2UID, player2DisplayName;
  bool? isGameStart;
  int? gameBoardType, gameBoardColorIndex;

  GameModel({ this.gameName, this.gameBoardType, this.gameBoardColorIndex, this.isGameStart, this.player1UID, this.player1DisplayName, this.player2UID, this.player2DisplayName });

  factory GameModel.to(Map<String, dynamic> data) {
    return GameModel(
        gameName: data["gameName"],
        gameBoardType: data["gameBoardType"],
        gameBoardColorIndex: data["gameBoardColorIndex"],
        isGameStart: data["isGameStart"],
        player1UID: data["player1UID"],
        player1DisplayName: data["player1DisplayName"],
        player2UID: data["player2UID"],
        player2DisplayName: data["player2DisplayName"]
    );
  }
}