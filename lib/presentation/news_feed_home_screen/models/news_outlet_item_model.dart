/// This class is used for news outlet items in the [news_feed_home_screen] screen.

// ignore_for_file: must_be_immutable
class NewsOutletItemModel {
  NewsOutletItemModel({
    this.id,
    this.name,
    this.logoPath,
    this.isSelected,
  }) {
    id = id ?? '';
    name = name ?? '';
    logoPath = logoPath ?? '';
    isSelected = isSelected ?? false;
  }

  String? id;
  String? name;
  String? logoPath;
  bool? isSelected;
}
