import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class BrowseCategoryWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  const BrowseCategoryWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyleHelper.instance.label10BoldPoppins.copyWith(
                  color: isSelected ? Color(0xFF000000) : appTheme.gray_400),
            ),
            if (isSelected) ...[
              SizedBox(height: 6.h),
              Container(
                width: 40.h,
                height: 2.h,
                decoration: BoxDecoration(
                  color: appTheme.yellow_900,
                  borderRadius: BorderRadius.circular(1.h),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
