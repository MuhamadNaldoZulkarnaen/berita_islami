
import '../../routes/app_routes.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  static Future<dynamic> pushNamed(
    String routeName, {
    dynamic arguments,
  }) async {
    final context = navigatorKey.currentContext;
    if (context == null) return;
    final builder = AppRoutes.routes[routeName];
    if (builder == null) return;
    return Navigator.of(context).push(_fadeRoute(builder(context)));
  }

  static void goBack() {
    return navigatorKey.currentState?.pop();
  }


  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    dynamic arguments,
  }) async {
    final context = navigatorKey.currentContext;
    if (context == null) return;
    final builder = AppRoutes.routes[routeName];
    if (builder == null) return;
    return Navigator.of(context).pushAndRemoveUntil(
      _fadeRoute(builder(context)),
      (route) => false,
    );
  }

  static PageRouteBuilder _fadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 350),
    );
  }

  static Future<dynamic> popAndPushNamed(
    String routeName, {
    dynamic arguments,
  }) async {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }
}
