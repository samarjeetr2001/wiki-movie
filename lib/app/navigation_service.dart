import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String homeRoute = "/home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
            settings: const RouteSettings(name: NavigationService.homeRoute),
            builder: (_) => const MyHomePage(title: "Home page"));
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
