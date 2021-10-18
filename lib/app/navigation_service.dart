import 'package:assignment/app/home/domain/entity/movie_detail_entity.dart';
import 'package:assignment/app/home/presentation/detail-page/detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/presentation/home-page/home_view.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String homeRoute = "/home";
  static const String detailRoute = "/detail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
            settings: const RouteSettings(name: NavigationService.homeRoute),
            builder: (_) => HomeView());

      case detailRoute:
        return MaterialPageRoute(
            settings: const RouteSettings(name: NavigationService.detailRoute),
            builder: (_) => MovieDetailView(
                  movieDetailEntity: settings.arguments as MovieDetailEntity,
                ));
      default:
        throw Exception("NavigationService: Invalid Navigation ");
    }
  }

  Future<void> navigateTo(String routeName,
      {bool shouldReplace = false, Object? arguments}) {
    if (shouldReplace) {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void navigateBack() {
    return navigatorKey.currentState!.pop();
  }

  void navigatePopUntil(String untilRoute) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(untilRoute));
  }

  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }
}
