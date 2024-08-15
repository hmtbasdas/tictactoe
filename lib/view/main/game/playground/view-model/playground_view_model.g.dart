// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playground_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlaygroundViewModel on _PlaygroundViewModelBase, Store {
  late final _$gameMoveListAtom =
      Atom(name: '_PlaygroundViewModelBase.gameMoveList', context: context);

  @override
  List<GameMoveModel> get gameMoveList {
    _$gameMoveListAtom.reportRead();
    return super.gameMoveList;
  }

  @override
  set gameMoveList(List<GameMoveModel> value) {
    _$gameMoveListAtom.reportWrite(value, super.gameMoveList, () {
      super.gameMoveList = value;
    });
  }

  late final _$gameMoveStatusAtom =
      Atom(name: '_PlaygroundViewModelBase.gameMoveStatus', context: context);

  @override
  GameMoveStatus get gameMoveStatus {
    _$gameMoveStatusAtom.reportRead();
    return super.gameMoveStatus;
  }

  @override
  set gameMoveStatus(GameMoveStatus value) {
    _$gameMoveStatusAtom.reportWrite(value, super.gameMoveStatus, () {
      super.gameMoveStatus = value;
    });
  }

  late final _$gameStatusAtom =
      Atom(name: '_PlaygroundViewModelBase.gameStatus', context: context);

  @override
  GameStatus get gameStatus {
    _$gameStatusAtom.reportRead();
    return super.gameStatus;
  }

  @override
  set gameStatus(GameStatus value) {
    _$gameStatusAtom.reportWrite(value, super.gameStatus, () {
      super.gameStatus = value;
    });
  }

  late final _$listenMovesAsyncAction =
      AsyncAction('_PlaygroundViewModelBase.listenMoves', context: context);

  @override
  Future<void> listenMoves(dynamic data, dynamic type) {
    return _$listenMovesAsyncAction.run(() => super.listenMoves(data, type));
  }

  late final _$showWinnerAsyncAction =
      AsyncAction('_PlaygroundViewModelBase.showWinner', context: context);

  @override
  Future<void> showWinner(GameMoveModel gameMoveModel) {
    return _$showWinnerAsyncAction.run(() => super.showWinner(gameMoveModel));
  }

  @override
  String toString() {
    return '''
gameMoveList: ${gameMoveList},
gameMoveStatus: ${gameMoveStatus},
gameStatus: ${gameStatus}
    ''';
  }
}
