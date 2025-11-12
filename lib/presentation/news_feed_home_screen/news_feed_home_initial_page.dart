import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import './provider/news_feed_home_provider.dart';
import './widgets/browse_category_widget.dart';
import './widgets/news_outlet_item.dart';

class NewsFeedHomeScreenInitialPage extends StatelessWidget {
  const NewsFeedHomeScreenInitialPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return NewsFeedHomeScreenInitialPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: appTheme.white_A700,
          boxShadow: [
            BoxShadow(
              color: appTheme.color050000,
              offset: Offset(0, 1.h),
              blurRadius: 1.h,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildHeader(context),
            _buildCategoryTabs(context),
            Expanded(
              child: _buildMainContent(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 2.h),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgSubtract,
            height: 22.h,
            width: 60.h,
          ),
          SizedBox(width: 5.h),
          Text(
            'LATEST',
            style: TextStyleHelper.instance.body12BoldPoppins,
          ),
          Container(
            width: 44.h,
            height: 22.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgIntersect,
                  width: 44.h,
                  height: 22.h,
                ),
                Positioned(
                  right: 13.h,
                  top: 4.h,
                  child: Text(
                    'NEWS',
                    style: TextStyleHelper.instance.label10BoldPoppins
                        .copyWith(color: appTheme.white_A700),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgIconlyBoldNotification,
            height: 14.h,
            width: 10.h,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs(BuildContext context) {
    return Consumer<NewsFeedHomeProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: EdgeInsets.only(top: 26.h, left: 26.h),
          alignment: Alignment.centerLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 24.h,
              direction: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () => provider.updateSelectedCategory(0),
                  child: Text(
                    'All news',
                    style: TextStyleHelper.instance.label10BoldPoppins.copyWith(
                        color: provider.selectedCategoryIndex == 0
                            ? Color(0xFF000000)
                            : appTheme.gray_400),
                  ),
                ),
                GestureDetector(
                  onTap: () => provider.updateSelectedCategory(1),
                  child: Text(
                    'Business',
                    style: TextStyleHelper.instance.label10BoldPoppins.copyWith(
                        color: provider.selectedCategoryIndex == 1
                            ? Color(0xFF000000)
                            : appTheme.gray_400),
                  ),
                ),
                GestureDetector(
                  onTap: () => provider.updateSelectedCategory(2),
                  child: Text(
                    'Politics',
                    style: TextStyleHelper.instance.label10BoldPoppins.copyWith(
                        color: provider.selectedCategoryIndex == 2
                            ? Color(0xFF000000)
                            : appTheme.gray_400),
                  ),
                ),
                GestureDetector(
                  onTap: () => provider.updateSelectedCategory(3),
                  child: Text(
                    'Tech',
                    style: TextStyleHelper.instance.label10BoldPoppins.copyWith(
                        color: provider.selectedCategoryIndex == 3
                            ? Color(0xFF000000)
                            : appTheme.gray_400),
                  ),
                ),
                GestureDetector(
                  onTap: () => provider.updateSelectedCategory(4),
                  child: Text(
                    'Healthy',
                    style: TextStyleHelper.instance.label10BoldPoppins.copyWith(
                        color: provider.selectedCategoryIndex == 4
                            ? Color(0xFF000000)
                            : appTheme.gray_400),
                  ),
                ),
                GestureDetector(
                  onTap: () => provider.updateSelectedCategory(5),
                  child: Text(
                    'Science',
                    style: TextStyleHelper.instance.label10BoldPoppins.copyWith(
                        color: provider.selectedCategoryIndex == 5
                            ? Color(0xFF000000)
                            : appTheme.gray_400),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Consumer<NewsFeedHomeProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          // Add bottom padding to avoid content being obscured by the
          // bottom navigation bar and to account for the keyboard (viewInsets).
          padding: EdgeInsets.only(
            left: 20.h,
            right: 20.h,
            bottom: MediaQuery.of(context).viewInsets.bottom + 80.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22.h),
              _buildFeaturedArticle(context, provider),
              SizedBox(height: 10.h),
              _buildPopularRedactions(context, provider),
              SizedBox(height: 16.h),
              _buildBrowseBy(context, provider),
              SizedBox(height: 18.h),
              _buildSecondaryArticle(context),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeaturedArticle(
      BuildContext context, NewsFeedHomeProvider provider) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: appTheme.color7AF2F2,
        borderRadius: BorderRadius.circular(10.h),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Making the Most of Outdoor Space for a Bountiful and Beautiful Vegetable Garden',
            style: TextStyleHelper.instance.body12MediumPoppins,
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Text(
                'Nature Channel',
                style: TextStyleHelper.instance.label9LightPoppins,
              ),
              SizedBox(width: 8.h),
              Container(
                width: 4.h,
                height: 4.h,
                decoration: BoxDecoration(
                  color: appTheme.gray_400,
                  borderRadius: BorderRadius.circular(2.h),
                ),
              ),
              SizedBox(width: 6.h),
              Text(
                '36min ago',
                style: TextStyleHelper.instance.label9LightPoppins
                    .copyWith(color: appTheme.gray_400),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                flex: 64,
                child: CustomImageView(
                  imagePath: ImageConstant.imgRectangle3,
                  height: 214.h,
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(10.h),
                ),
              ),
              SizedBox(width: 10.h),
              Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle4,
                    height: 102.h,
                    width: 102.h,
                    fit: BoxFit.cover,
                    radius: BorderRadius.circular(10.h),
                  ),
                  SizedBox(height: 10.h),
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle5,
                    height: 102.h,
                    width: 102.h,
                    fit: BoxFit.cover,
                    radius: BorderRadius.circular(10.h),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgGroup15,
                height: 2.h,
                width: 10.h,
              ),
              Spacer(),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => provider.toggleLike(),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgVector,
                      height: 10.h,
                      width: 10.h,
                      color: provider.isLiked ? Color(0xFFF98121) : null,
                    ),
                    SizedBox(width: 6.h),
                    Text(
                      provider.likeCount.toString(),
                      style: TextStyleHelper.instance.label9RegularPoppins,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.h),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup12,
                    height: 12.h,
                    width: 12.h,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    '201',
                    style: TextStyleHelper.instance.label9RegularPoppins,
                  ),
                ],
              ),
              SizedBox(width: 20.h),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgVectorGray600,
                    height: 8.h,
                    width: 10.h,
                  ),
                  SizedBox(width: 6.h),
                  Text(
                    '122',
                    style: TextStyleHelper.instance.label9RegularPoppins,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPopularRedactions(
      BuildContext context, NewsFeedHomeProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Redactions',
              style: TextStyleHelper.instance.body14BoldPoppins,
            ),
            Text(
              'View All',
              style: TextStyleHelper.instance.label10BoldPoppins
                  .copyWith(color: appTheme.gray_400),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 26.h,
            direction: Axis.horizontal,
            children: provider.newsOutlets.map((outlet) {
              return NewsOutletItem(
                model: outlet,
                onTap: () => provider.selectNewsOutlet(outlet),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBrowseBy(BuildContext context, NewsFeedHomeProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Browse by',
          style: TextStyleHelper.instance.body14BoldPoppins,
        ),
        SizedBox(height: 14.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 6.h),
          child: Wrap(
            spacing: 40.h,
            direction: Axis.horizontal,
            children: [
              BrowseCategoryWidget(
                title: 'Trending',
                isSelected: provider.selectedBrowseIndex == 0,
                onTap: () => provider.updateSelectedBrowse(0),
              ),
              BrowseCategoryWidget(
                title: 'Recomendation',
                isSelected: provider.selectedBrowseIndex == 1,
                onTap: () => provider.updateSelectedBrowse(1),
              ),
              BrowseCategoryWidget(
                title: 'Newest',
                isSelected: provider.selectedBrowseIndex == 2,
                onTap: () => provider.updateSelectedBrowse(2),
              ),
              BrowseCategoryWidget(
                title: 'Noteworthy',
                isSelected: provider.selectedBrowseIndex == 3,
                onTap: () => provider.updateSelectedBrowse(3),
              ),
              BrowseCategoryWidget(
                title: 'Science',
                isSelected: provider.selectedBrowseIndex == 4,
                onTap: () => provider.updateSelectedBrowse(4),
              ),
              BrowseCategoryWidget(
                title: 'Politics',
                isSelected: provider.selectedBrowseIndex == 5,
                onTap: () => provider.updateSelectedBrowse(5),
              ),
              BrowseCategoryWidget(
                title: 'Tech',
                isSelected: provider.selectedBrowseIndex == 6,
                onTap: () => provider.updateSelectedBrowse(6),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecondaryArticle(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 6.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2021\'s most brilliant horror movie',
                        style: TextStyleHelper.instance.body12MediumPoppins,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'The new Candyman and how horror is\nreckoning with racism',
                        style: TextStyleHelper.instance.label10RegularPoppins,
                      ),
                    ],
                  ),
            ),
          ),
          SizedBox(width: 12.h),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle8,
            height: 80.h,
            width: 80.h,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(18.h),
          ),
        ],
      ),
    );
  }
}
