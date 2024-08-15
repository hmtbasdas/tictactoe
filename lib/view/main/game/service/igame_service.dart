import 'package:tictactoe/product/model/game_model.dart';

abstract class IGameService {
  Future<dynamic> createGame(String gameName, int gameBoardType, int gameBoardColorIndex);
  Future<dynamic> playGame(String gameName);
  Future<dynamic> deleteGame(String gameName);

  Future<dynamic> tapPlayground(GameModel gameModel, int boxIndex);
  Future<dynamic> deletePlayground(String gameName);
}