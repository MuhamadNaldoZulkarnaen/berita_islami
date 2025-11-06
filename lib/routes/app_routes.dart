import 'package:flutter/material.dart';
import '../presentation/news_feed_home_screen/news_feed_home_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String newsFeedHomeScreen = '/news_feed_home_screen';
  static const String newsFeedHomeScreenInitialPage =
      '/news_feed_home_screen_initial_page';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
        newsFeedHomeScreen: NewsFeedHomeScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: AppNavigationScreen.builder
      };
}
