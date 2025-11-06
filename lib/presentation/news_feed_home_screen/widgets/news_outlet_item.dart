import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/news_outlet_item_model.dart';

class NewsOutletItem extends StatelessWidget {
  final NewsOutletItemModel model;
  final VoidCallback? onTap;

  const NewsOutletItem({
    Key? key,
    required this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.h,
        height: 40.h,
        padding: EdgeInsets.all(6.h),
        decoration: BoxDecoration(
          color:
              model.isSelected ?? false ? Color(0xFFF98121) : appTheme.gray_100,
          borderRadius: BorderRadius.circular(20.h),
        ),
        child: Center(
          child: Container(
            width: 28.h,
            height: 28.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(model.logoPath ?? ''),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
