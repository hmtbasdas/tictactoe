import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tictactoe/core/base/view/base_view.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/core/init/theme/app_theme.dart';
import 'package:tictactoe/core/manager/manager.dart';
import 'package:tictactoe/core/manager/manager_model.dart';
import 'package:tictactoe/product/widget/default_padding.dart';
import 'package:tictactoe/view/main/home/view-model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) => buildView(context, viewModel),
    );
  }

  Widget buildView(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.centerLeft,
          child: DefaultPadding(
            child: Text(
              Manager.instance.managerModel.user!.displayName ?? "",
              maxLines: 1,
              style: AppTheme().whiteBoldTS,
            ),
          ),
        ),
        leadingWidth: viewModel.dynamicWidth(context, 1),
        actions: [
          IconButton(
            onPressed: viewModel.signOut,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: DefaultPadding(
        top: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: viewModel.goCreateGameView,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  fixedSize: const Size(120, 120),
                  backgroundColor: greenColor,
                ),
                child: Align(
                  child: Text(
                    "Create Game",
                    textAlign: TextAlign.center,
                    style: AppTheme().whiteBoldTS,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Games",
              style: AppTheme().whiteBoldTS.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Observer(
                builder: (context) {
                  return Manager.instance.managerModel.gameListStatus == GameListStatus.ready
                      ? ListView.separated(
                          itemCount: Manager.instance.managerModel.gameList.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            bool isMine = Manager.instance.managerModel.gameList[index].player1UID == Manager.instance.managerModel.user!.uid;
                            return Container(
                              height: 60,
                              width: viewModel.dynamicWidth(context, 1),
                              color: whiteColor,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      Manager.instance.managerModel.gameList[index].gameName ?? "",
                                      maxLines: 1,
                                      style: AppTheme().blackBoldTS.copyWith(fontSize: 14),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => isMine
                                        ? viewModel.deleteGame(Manager.instance.managerModel.gameList[index].gameName ?? "")
                                        : viewModel.playGame(Manager.instance.managerModel.gameList[index]),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isMine ? errorColor : greenColor,
                                      shape: const RoundedRectangleBorder(),
                                    ),
                                    child: Text(
                                      isMine ? "Delete" : "Play",
                                      style: AppTheme().whiteBoldTS.copyWith(fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 8);
                          },
                        )
                      : const SizedBox.shrink();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
