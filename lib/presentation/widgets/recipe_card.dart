import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui/constants/number_constant.dart';
import 'package:recipe_app_ui/core/app_colors.dart';
import 'package:recipe_app_ui/core/app_textstyles.dart';
import 'package:recipe_app_ui/core/asset_res.dart';
import 'package:recipe_app_ui/core/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  final double width;
  final double imageHeight;
  final bool showTimeBadge;
  final bool showFavoriteButton;
  final bool useSmallTitle;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const RecipeCard({
    super.key,
    required this.recipe,
    this.width = NumberConstant.recipeCardWidth,
    this.imageHeight = NumberConstant.recipeCardImageHeight,
    this.showTimeBadge = true,
    this.showFavoriteButton = false,
    this.useSmallTitle = false,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: Hero(
                tag: 'recipe-image-${recipe.id}',
                child: ClipRRect(
                  borderRadius: .circular(NumberConstant.recipeCardRadius),
                  child: Stack(
                    fit: .expand,
                    children: [
                      Positioned.fill(
                        child: CachedNetworkImage(imageUrl: recipe.imagePath, fit: .cover, width: width, height: imageHeight,),
                      ),
                      if (showTimeBadge)
                        Positioned(
                          left: 11,
                          top: 11,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.timeBadgeColor,
                              borderRadius: .circular(NumberConstant.timeBadgeRadius),
                            ),
                            child: Padding(
                              padding: .symmetric(
                                horizontal: NumberConstant.timeBadgeHorizontalPadding,
                                vertical: NumberConstant.timeBadgeVerticalPadding,
                              ),
                              child: Text(recipe.cookTime, style: AppTextStyles.timeBadge,),
                            ),
                          ),
                        ),
                      if (showFavoriteButton)
                        Positioned(
                          left: 10,
                          top: 10,
                          child: GestureDetector(
                            onTap: onFavoriteTap,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: .circle,
                              ),
                              child: Padding(
                                padding: .all(NumberConstant.favoriteHeartPadding),
                                child: SvgPicture.asset(AssetRes.icHeart,),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: .only(top: useSmallTitle ? 10 : 9),
              //recipe.title
              child: Text(
                recipe.title,
                style: useSmallTitle ? AppTextStyles.recipeCardTitleSmall : AppTextStyles.recipeCardTitle,
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            //recipe.description
            Text(
              recipe.description,
              style: AppTextStyles.recipeCardDescription,
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
