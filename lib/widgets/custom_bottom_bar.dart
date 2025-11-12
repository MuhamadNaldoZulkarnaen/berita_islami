import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomBottomBar - A customizable bottom navigation bar component
 * 
 * Features:
 * - Supports 5 navigation items with icons and labels
 * - Active/inactive state handling with visual indicators
 * - Customizable navigation items through data model
 * - Responsive design with SizeUtils
 * - Route-based navigation support
 * 
 * @param bottomBarItemList List of navigation items to display
 * @param selectedIndex Currently selected tab index (0-based)
 * @param onChanged Callback function triggered when tab is tapped
 */
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    required this.bottomBarItemList,
    required this.onChanged,
    this.selectedIndex = 0,
  }) : super(key: key);

  /// List of bottom bar items with their properties
  final List<CustomBottomBarItem> bottomBarItemList;

  /// Current selected index of the bottom bar
  final int selectedIndex;

  /// Callback function triggered when a bottom bar item is tapped
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    // Use SafeArea to respect system bottom insets (e.g. gesture area)
    // and increase container height slightly to avoid small pixel overflows.
    return SafeArea(
      bottom: true,
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: appTheme.gray_100,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 26.h),
              child: Text(
                "Esther Howard     |   3h ago",
                style: TextStyleHelper.instance.label10RegularPoppins
                    .copyWith(color: appTheme.gray_600, height: 1.5),
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              height: 56.h,
              padding: EdgeInsets.symmetric(horizontal: 38.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActiveHomeItem(),
                  ...List.generate(
                    bottomBarItemList.length - 1,
                    (index) => _buildBottomBarItem(
                      bottomBarItemList[index + 1],
                      selectedIndex == index + 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveHomeItem() {
    final isSelected = selectedIndex == 0;
    return InkWell(
      onTap: () => onChanged(0),
      child: Column(
        children: [
          if (isSelected)
            Container(
              width: 28.h,
              height: 2.h,
              decoration: BoxDecoration(
                color: appTheme.yellow_900,
                borderRadius: BorderRadius.circular(1.h),
              ),
            ),
          SizedBox(height: isSelected ? 20.h : 22.h),
          CustomImageView(
            imagePath: bottomBarItemList.isNotEmpty
                ? (bottomBarItemList[0].icon ?? ImageConstant.imgNavHome)
                : ImageConstant.imgNavHome,
            height: 12.h,
            width: 10.h,
          ),
          SizedBox(height: 8.h),
          Text(
            bottomBarItemList.isNotEmpty
                ? (bottomBarItemList[0].title ?? "Home")
                : "Home",
            style: TextStyleHelper.instance.label7RegularPoppins.copyWith(
                color: isSelected ? Color(0xFFF98121) : appTheme.gray_600,
                height: 1.57),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBarItem(CustomBottomBarItem item, bool isSelected) {
    return InkWell(
      onTap: () {
        final index = bottomBarItemList.indexOf(item);
        onChanged(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: item.icon ?? ImageConstant.imgImageNotFound,
            height: item.title == "Coverage"
                ? 14.h
                : (item.title == "Inbox"
                    ? 12.h
                    : (item.title == "Profile" ? 16.h : 14.h)),
            width: 14.h,
          ),
          SizedBox(
              height: item.title == "Coverage" || item.title == "Inbox"
                  ? 10.h
                  : 8.h),
          Text(
            item.title ?? "",
            style: TextStyleHelper.instance.label7RegularPoppins.copyWith(
                color: isSelected ? Color(0xFFF98121) : appTheme.gray_600,
                height: 1.57),
          ),
        ],
      ),
    );
  }
}

/// Item data model for custom bottom bar
class CustomBottomBarItem {
  CustomBottomBarItem({
    this.icon,
    this.activeIcon,
    this.title,
    this.routeName,
  });

  /// Path to the icon (SVG or PNG)
  final String? icon;

  /// Path to the active state icon
  final String? activeIcon;

  /// Title text shown below the icon
  final String? title;

  /// Route name for navigation
  final String? routeName;
}
