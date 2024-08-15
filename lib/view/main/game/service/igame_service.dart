abstract class IGameService {
  Future<dynamic> createGame(String gameName, int gameBoardColorIndex);
  Future<dynamic> playGame(String gameName);
  Future<dynamic> deleteGame(String gameName);
}