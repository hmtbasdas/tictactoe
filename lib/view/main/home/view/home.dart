import 'package:flutter/material.dart';
import 'package:tictactoe/core/constant/color/colors.dart';
import 'package:tictactoe/core/manager/manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Manager.instance.managerModel.firebaseAuth.currentUser!.uid),
            Text(Manager.instance.managerModel.firebaseAuth.currentUser!.displayName!)
          ],
        ),
      ),
    );
  }
}
