class GameModel {
  String? gameName, player1UID, player1DisplayName, player2UID, player2DisplayName;
  bool? isGameStart;
  int? gameBoardColorIndex;

  GameModel({ this.gameName, this.gameBoardColorIndex, this.isGameStart, this.player1UID, this.player1DisplayName, this.player2UID, this.player2DisplayName });

  factory GameModel.to(Map<String, dynamic> data) {
    return GameModel(
        gameName: data["gameName"],
        gameBoardColorIndex: data["gameBoardColorIndex"],
        isGameStart: data["isGameStart"],
        player1UID: data["player1UID"],
        player1DisplayName: data["player1DisplayName"],
        player2UID: data["player2UID"],
        player2DisplayName: data["player2DisplayName"]
    );
  }
}