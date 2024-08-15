import 'package:flutter/material.dart';
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
      },
      onPageBuilder: (BuildContext context, PlaygroundViewModel viewModel) => buildView(context, viewModel),
    );
  }

  Widget buildView(BuildContext context, PlaygroundViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
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
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 9,
                itemBuilder: (_, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    color: whiteColor,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
