import 'package:flutter/material.dart';
import 'package:tictactoe/core/constant/navigation/navigation_constant.dart';
import 'package:tictactoe/view/auth/login/view/login_view.dart';
import 'package:tictactoe/view/auth/splash/view/splash_view.dart';
import 'package:tictactoe/view/main/game/create_game/view/create_game_view.dart';
import 'package:tictactoe/view/main/game/playground/view/playground_view.dart';
import 'package:tictactoe/view/main/home/view/home.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(dynamic args) {
    switch (args.name) {
      case NavigationConstant.splash:
        return normalNavigate(const SplashView(), NavigationConstant.splash);
      case NavigationConstant.login:
        return normalNavigate(const LoginView(), NavigationConstant.login);
      case NavigationConstant.home:
        return normalNavigate(const HomeView(), NavigationConstant.home);
      case NavigationConstant.createGame:
        return normalNavigate(const CreateGameView(), NavigationConstant.createGame);
      case NavigationConstant.playground:
        return normalNavigate(PlaygroundView(gameModel: args.arguments), NavigationConstant.playground);
      default:
        return normalNavigate(const SplashView(), NavigationConstant.splash);
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}