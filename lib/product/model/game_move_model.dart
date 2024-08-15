// oyuncuların oynadıkları hamleler için kullanılan modeldir
class GameMoveModel {
  String? playerUID, type;
  int? boxIndex, moveNumber;

  GameMoveModel({ this.playerUID, this.boxIndex, this.type });

  factory GameMoveModel.to(Map<String, dynamic> data) {
    return GameMoveModel(
      playerUID: data["playerUID"],
      boxIndex: data["boxIndex"],
      type: data["type"],
    );
  }
}