import 'package:flutter/material.dart';
import '../presentation/news_feed_home_screen/news_feed_home_screen.dart';
import '../presentation/search_screen/search_screen.dart';
import '../presentation/coverage_screen/coverage_screen.dart';
import '../presentation/inbox_screen/inbox_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/greeting_screen/greeting_screen.dart';

class AppRoutes {
  static const String newsFeedHomeScreen = '/news_feed_home_screen';
  static const String newsFeedHomeScreenInitialPage =
      '/news_feed_home_screen_initial_page';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';
  static const String searchScreen = '/search_screen';
  static const String coverageScreen = '/coverage_screen';
  static const String inboxScreen = '/inbox_screen';
  static const String profileScreen = '/profile_screen';

  static Map<String, WidgetBuilder> get routes => {
        newsFeedHomeScreen: NewsFeedHomeScreen.builder,
    searchScreen: SearchScreen.builder,
    coverageScreen: CoverageScreen.builder,
    inboxScreen: InboxScreen.builder,
    profileScreen: ProfileScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        // show greeting screen first
        initialRoute: GreetingScreen.builder
      };
}
