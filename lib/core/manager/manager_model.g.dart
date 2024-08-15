// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManagerModel on _ManagerModelBase, Store {
  late final _$gameListAtom =
      Atom(name: '_ManagerModelBase.gameList', context: context);

  @override
  List<GameModel> get gameList {
    _$gameListAtom.reportRead();
    return super.gameList;
  }

  @override
  set gameList(List<GameModel> value) {
    _$gameListAtom.reportWrite(value, super.gameList, () {
      super.gameList = value;
    });
  }

  late final _$gameListStatusAtom =
      Atom(name: '_ManagerModelBase.gameListStatus', context: context);

  @override
  GameListStatus get gameListStatus {
    _$gameListStatusAtom.reportRead();
    return super.gameListStatus;
  }

  @override
  set gameListStatus(GameListStatus value) {
    _$gameListStatusAtom.reportWrite(value, super.gameListStatus, () {
      super.gameListStatus = value;
    });
  }

  late final _$_ManagerModelBaseActionController =
      ActionController(name: '_ManagerModelBase', context: context);

  @override
  void updateGameList(GameModel newGameModel, DocumentChangeType type) {
    final _$actionInfo = _$_ManagerModelBaseActionController.startAction(
        name: '_ManagerModelBase.updateGameList');
    try {
      return super.updateGameList(newGameModel, type);
    } finally {
      _$_ManagerModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gameList: ${gameList},
gameListStatus: ${gameListStatus}
    ''';
  }
}
