// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_game_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateGameViewModel on _CreateGameViewModelBase, Store {
  late final _$selectedGameBoardColorIndexAtom = Atom(
      name: '_CreateGameViewModelBase.selectedGameBoardColorIndex',
      context: context);

  @override
  int get selectedGameBoardColorIndex {
    _$selectedGameBoardColorIndexAtom.reportRead();
    return super.selectedGameBoardColorIndex;
  }

  @override
  set selectedGameBoardColorIndex(int value) {
    _$selectedGameBoardColorIndexAtom
        .reportWrite(value, super.selectedGameBoardColorIndex, () {
      super.selectedGameBoardColorIndex = value;
    });
  }

  late final _$_CreateGameViewModelBaseActionController =
      ActionController(name: '_CreateGameViewModelBase', context: context);

  @override
  void changeGameBoardColor(int index) {
    final _$actionInfo = _$_CreateGameViewModelBaseActionController.startAction(
        name: '_CreateGameViewModelBase.changeGameBoardColor');
    try {
      return super.changeGameBoardColor(index);
    } finally {
      _$_CreateGameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedGameBoardColorIndex: ${selectedGameBoardColorIndex}
    ''';
  }
}
