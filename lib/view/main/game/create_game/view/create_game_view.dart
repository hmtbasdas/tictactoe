import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tictactoe/core/base/view/base_view.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/core/init/theme/app_theme.dart';
import 'package:tictactoe/core/manager/manager.dart';
import 'package:tictactoe/product/widget/default_padding.dart';
import 'package:tictactoe/view/main/game/create_game/view-model/create_game_view_model.dart';

class CreateGameView extends StatelessWidget {
  const CreateGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateGameViewModel>(
      viewModel: CreateGameViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CreateGameViewModel viewModel) => buildView(context, viewModel),
    );
  }

  Widget buildView(BuildContext context, CreateGameViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Game",
          style: AppTheme().whiteBoldTS,
        ),
      ),
      body: DefaultPadding(
        top: 16,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: viewModel.gameNameTextEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Give a name",
                  filled: true,
                  fillColor: whiteColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Choose a board type",
                style: AppTheme().whiteBoldTS,
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  itemCount: Manager.instance.managerModel.gameBoardType.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Observer(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => viewModel.changeGameBoardType(Manager.instance.managerModel.gameBoardType[index].id),
                          child: Container(
                            height: 50,
                            width: viewModel.dynamicWidth(context, .33) - 16, // -16 default padding
                            color: [basicLevel, mediumLevel, hardLevel][index],
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Manager.instance.managerModel.gameBoardType[index].name,
                                    style: AppTheme().whiteBoldTS,
                                  ),
                                  viewModel.selectedGameBoardType == Manager.instance.managerModel.gameBoardType[index].id
                                      ? const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: whiteColor,
                                            size: 24,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 8);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Choose a board color",
                style: AppTheme().whiteBoldTS,
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  itemCount: gameBoardColorList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Observer(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => viewModel.changeGameBoardColor(index),
                          child: Container(
                            height: 100,
                            width: 100,
                            color: gameBoardColorList[index],
                            child: viewModel.selectedGameBoardColorIndex == index
                                ? const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: whiteColor,
                                      size: 36,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 8);
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: viewModel.validation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  fixedSize: Size(viewModel.dynamicWidth(context, 1), 50),
                ),
                child: Text(
                  "Create Game",
                  maxLines: 1,
                  style: AppTheme().whiteBoldTS.copyWith(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
