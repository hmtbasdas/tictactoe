import 'package:flutter/material.dart';
import 'package:tictactoe/core/base/view/base_view.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/core/init/theme/app_theme.dart';
import 'package:tictactoe/core/manager/manager.dart';
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
              child: ListView.separated(
                itemCount: 8,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: viewModel.dynamicWidth(context, 1),
                    color: whiteColor,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
