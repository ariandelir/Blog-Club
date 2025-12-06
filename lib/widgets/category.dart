import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/extensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:blogclub/core/data/data.dart';
import 'package:blogclub/widgets/carousel/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: context.categories.length,

      /// Building each category card
      itemBuilder: (context, index, realIndex) {
        return CategoryItem(
          left: realIndex == 0 ? 32 : 8, // first item padding
          right: realIndex == context.categories.length - 1
              ? 32
              : 8, // last item padding
          category: context.categories[realIndex],
        );
      },

      /// Carousel behavior
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        viewportFraction: AppDimensions.kViewportFractionSize,
        aspectRatio: AppDimensions.kAspectRatioSize,
        initialPage: AppDimensions.kInitialPageSize,
        scrollPhysics: const BouncingScrollPhysics(),
        disableCenter: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;

  /// vertical margin is always zero
  final double top = 0;
  final double bottom = 0;

  const CategoryItem({
    super.key,
    required this.category,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: Stack(
        children: [
          /// --- BACKGROUND SHADOW ---
          Positioned.fill(
            top: AppNumbers.kCategorySecondPositionTop,
            right: AppNumbers.kCategorySecondPositionRight,
            left: AppNumbers.kCategorySecondPositionLeft,
            bottom: AppNumbers.kCategorySecondPositionBottom,
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: AppDimensions.kShadowBlurRadius,
                    color: AppColors.kCategoryShadowColor,
                  ),
                ],
              ),
            ),
          ),

          /// --- IMAGE CARD WITH GRADIENT OVERLAY ---
          Positioned.fill(
            child: Container(
              margin: AppDimensions.kMarginCategory,
              foregroundDecoration: BoxDecoration(
                borderRadius: AppDimensions.kLargeCircularBorderRadius,

                /// bottom to center gradient for readable title text
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [AppColors.kDarkBlue, AppColors.kTransparent],
                ),
              ),
              decoration: BoxDecoration(
                color: AppColors.kBlue,
                borderRadius: AppDimensions.kLargeCircularBorderRadius,
              ),
              child: ClipRRect(
                borderRadius: AppDimensions.kLargeCircularBorderRadius,
                child: Image.asset(
                  AppStrings.postImage(category.imageFileName),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /// --- CATEGORY TITLE ---
          Positioned(
            bottom: AppNumbers.kCategoryThirdPositionBottom,
            left: AppNumbers.kCategoryThirdPositionLeft,
            child: Text(
              category.title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.apply(color: AppColors.kOnPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
