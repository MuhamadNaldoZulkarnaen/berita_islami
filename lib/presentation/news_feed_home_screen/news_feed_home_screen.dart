import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import './news_feed_home_initial_page.dart';
import './provider/news_feed_home_provider.dart';
import '../search_screen/search_screen.dart';
import '../coverage_screen/coverage_screen.dart';
import '../inbox_screen/inbox_screen.dart';
import '../profile_screen/profile_screen.dart';

class NewsFeedHomeScreen extends StatefulWidget {
  const NewsFeedHomeScreen({Key? key}) : super(key: key);

  @override
  NewsFeedHomeScreenState createState() => NewsFeedHomeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsFeedHomeProvider(),
      child: NewsFeedHomeScreen(),
    );
  }
}

class NewsFeedHomeScreenState extends State<NewsFeedHomeScreen> {
  // use for the bottom bar screen navigation
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.newsFeedHomeScreenInitialPage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, a1, a2) => getCurrentPage(
                context,
                routeSetting.name ??
                    ''), // Modified: Added null coalescing operator to handle null route name
            transitionDuration: Duration(seconds: 0),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    var bottomBarItemList = <CustomBottomBarItem>[
      CustomBottomBarItem(
        icon: ImageConstant.imgNavHome,
        title: 'Home',
        routeName: AppRoutes.newsFeedHomeScreenInitialPage,
      ),
      CustomBottomBarItem(
        icon: ImageConstant.imgNavExplore,
        title: 'Explore',
        routeName: AppRoutes.searchScreen,
      ),
      CustomBottomBarItem(
        icon: ImageConstant.imgNavCoverage,
        title: 'Coverage',
        routeName: AppRoutes.coverageScreen,
      ),
      CustomBottomBarItem(
        icon: ImageConstant.imgNavInbox,
        title: 'Inbox',
        routeName: AppRoutes.inboxScreen,
      ),
      CustomBottomBarItem(
        icon: ImageConstant.imgNavProfile,
        title: 'Profile',
        routeName: AppRoutes.profileScreen,
      ),
    ];

    return Consumer<NewsFeedHomeProvider>(
      builder: (context, provider, child) {
        return CustomBottomBar(
          bottomBarItemList: bottomBarItemList,
            onChanged: (index) {
            provider.updateSelectedIndex(index);
            var bottomBarItem = bottomBarItemList[index];
            if (bottomBarItem.routeName != null && bottomBarItem.routeName!.isNotEmpty) {
              navigatorKey.currentState?.pushNamed(bottomBarItem.routeName!);
            }
          },
          selectedIndex: provider.selectedBottomBarIndex,
        );
      },
    );
  }

  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.newsFeedHomeScreenInitialPage:
        return NewsFeedHomeScreenInitialPage.builder(context);
      case AppRoutes.searchScreen:
        return SearchScreen.builder(context);
      case AppRoutes.coverageScreen:
        return CoverageScreen.builder(context);
      case AppRoutes.inboxScreen:
        return InboxScreen.builder(context);
      case AppRoutes.profileScreen:
        return ProfileScreen.builder(context);
      default:
        return Container();
    }
  }
}
