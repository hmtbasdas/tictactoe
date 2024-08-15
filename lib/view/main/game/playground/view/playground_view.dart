import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tictactoe/core/base/view/base_view.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/core/init/theme/app_theme.dart';
import 'package:tictactoe/product/model/game_model.dart';
import 'package:tictactoe/product/widget/default_padding.dart';
import 'package:tictactoe/view/main/game/playground/view-model/playground_view_model.dart';

class PlaygroundView extends StatelessWidget {
  const PlaygroundView({required this.gameModel, super.key});

  final GameModel gameModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<PlaygroundViewModel>(
      viewModel: PlaygroundViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        model.setGameModel(gameModel);
      },
      onPageBuilder: (BuildContext context, PlaygroundViewModel viewModel) => buildView(context, viewModel),
    );
  }

  Widget buildView(BuildContext context, PlaygroundViewModel viewModel) {
    return Scaffold(
      body: SafeArea(child: Observer(
        builder: (context) {
          return AbsorbPointer(
            absorbing: viewModel.gameStatus == GameStatus.finished,
            child: DefaultPadding(
              top: 16,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          gameModel.player1DisplayName!,
                          style: AppTheme().whiteBoldTS,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          gameModel.player2DisplayName!,
                          textAlign: TextAlign.end,
                          style: AppTheme().whiteBoldTS,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                      color: gameBoardColorList[gameModel.gameBoardColorIndex ?? 0],
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Observer(
                        builder: (context) {
                          return viewModel.gameMoveStatus == GameMoveStatus.waiting
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: gameModel.gameBoardType!,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: gameModel.gameBoardType! * gameModel.gameBoardType!,
                                  itemBuilder: (_, index) {
                                    String moveText = "";
                                    bool hasUsed = false;
                                    for (var move in viewModel.gameMoveList) {
                                      if (move.boxIndex == index) {
                                        moveText = move.type!;
                                        hasUsed = true;
                                      }
                                    }
                                    return GestureDetector(
                                      onTap: () => !hasUsed ? viewModel.tap(gameModel, index) : null,
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        color: whiteColor,
                                        child: Center(
                                          child: Text(
                                            moveText,
                                            style: AppTheme().blackTS.copyWith(
                                                fontSize: gameModel.gameBoardType! == 3
                                                    ? 72
                                                    : gameModel.gameBoardType! == 4
                                                        ? 64
                                                        : gameModel.gameBoardType! == 5
                                                            ? 32
                                                            : 64),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : const SizedBox.shrink();
                        },
                      )),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
