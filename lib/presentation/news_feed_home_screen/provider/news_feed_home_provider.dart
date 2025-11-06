import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/news_feed_home_model.dart';
import '../models/news_outlet_item_model.dart';

class NewsFeedHomeProvider extends ChangeNotifier {
  NewsFeedHomeModel newsFeedHomeModel = NewsFeedHomeModel();

  int selectedBottomBarIndex = 0;
  int selectedCategoryIndex = 0;
  int selectedBrowseIndex = 0;
  bool isLiked = false;
  int likeCount = 800;

  List<NewsOutletItemModel> newsOutlets = [
    NewsOutletItemModel(
      id: '1',
      name: 'CNN',
      logoPath: ImageConstant.img,
      isSelected: false,
    ),
    NewsOutletItemModel(
      id: '2',
      name: 'BBC',
      logoPath: ImageConstant.img0x0,
      isSelected: false,
    ),
    NewsOutletItemModel(
      id: '3',
      name: 'MSN',
      logoPath: ImageConstant.img1,
      isSelected: false,
    ),
    NewsOutletItemModel(
      id: '4',
      name: 'CNBC',
      logoPath: ImageConstant.img2,
      isSelected: false,
    ),
    NewsOutletItemModel(
      id: '5',
      name: 'FOX',
      logoPath: ImageConstant.img3,
      isSelected: false,
    ),
    NewsOutletItemModel(
      id: '6',
      name: 'USA Today',
      logoPath: ImageConstant.img4,
      isSelected: false,
    ),
  ];

  void updateSelectedIndex(int index) {
    selectedBottomBarIndex = index;
    notifyListeners();
  }

  void updateSelectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void updateSelectedBrowse(int index) {
    selectedBrowseIndex = index;
    notifyListeners();
  }

  void toggleLike() {
    isLiked = !isLiked;
    if (isLiked) {
      likeCount += 1;
    } else {
      likeCount -= 1;
    }
    notifyListeners();
  }

  void selectNewsOutlet(NewsOutletItemModel outlet) {
    for (var item in newsOutlets) {
      item.isSelected = false;
    }
    outlet.isSelected = true;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
