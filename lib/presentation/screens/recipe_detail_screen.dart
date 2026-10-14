import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui/constants/number_constant.dart';
import 'package:recipe_app_ui/constants/string_const.dart';
import 'package:recipe_app_ui/core/app_colors.dart';
import 'package:recipe_app_ui/core/app_textstyles.dart';
import 'package:recipe_app_ui/core/asset_res.dart';
import 'package:recipe_app_ui/core/models/recipe_model.dart';
import 'package:recipe_app_ui/presentation/widgets/circular_icon_button.dart';
import 'package:recipe_app_ui/providers/recipe_detail_provider.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RecipeDetailProvider>();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: .symmetric(horizontal: NumberConstant.horizontalPadding),
              child: Column(
                children: [
                  _buildTopNav(context),
                  Expanded(
                    child: ListView(
                      padding: .only(bottom: 100),
                      children: [
                        _buildTitleRow(),
                        _buildMetaRow(),
                        _buildHeroImage(),
                        _buildDescription(provider),
                        Padding(
                          padding: .only(top: NumberConstant.detailAccordionTopPadding),
                          child: _buildAccordion(
                            title: StringConst.ingredients,
                            isExpanded: provider.isIngredientsExpanded,
                            onTap: provider.toggleIngredients,
                            child: _buildIngredientsList(),
                          ),
                        ),
                        _buildAccordion(
                          title: StringConst.directions,
                          isExpanded: provider.isDirectionsExpanded,
                          onTap: provider.toggleDirections,
                          child: Text(recipe.directions, style: AppTextStyles.accordionBody,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: .topCenter,
                      end: .bottomCenter,
                      colors: [
                        AppColors.whiteColor.withValues(alpha: 0),
                        AppColors.whiteColor,
                      ],
                      stops: const [0, 0.7],
                    ),
                  ),
                  child: const SizedBox(height: 105),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: NumberConstant.watchVideoBottomOffset,
              child: Center(child: _buildWatchVideoButton()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNav(BuildContext context) {
    return Padding(
      padding: .symmetric(vertical: 3),
      child: Row(
        children: [
          CircularIconButton(
            iconPath: AssetRes.icBack,
            onTap: () => context.pop(),
          ),
          Expanded(
            child: Text(StringConst.recipes, style: AppTextStyles.topNavTitle, textAlign: .center,),
          ),
          Opacity(
            opacity: 0,
            child: CircularIconButton(iconPath: AssetRes.icBack,),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      crossAxisAlignment: .start,
      children: [
        Expanded(child: Text(recipe.title, style: AppTextStyles.detailTitle,),),
        Padding(
          padding: .only(top: 5),
          child: Row(
            spacing: NumberConstant.detailRatingGap,
            children: [
              SvgPicture.asset(AssetRes.icStar,),
              Text(recipe.rating.toStringAsFixed(1), style: AppTextStyles.rating,),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetaRow() {
    return Row(
      spacing: NumberConstant.detailMetaGap,
      children: [
        Row(
          spacing: NumberConstant.detailMetaIconGap,
          children: [
            SvgPicture.asset(AssetRes.icClock,),
            Text(recipe.cookTime, style: AppTextStyles.metaLabel,),
          ],
        ),
        Row(
          spacing: NumberConstant.detailMetaIconGap,
          children: [
            SvgPicture.asset(AssetRes.icDifficulty,),
            Text(recipe.difficulty, style: AppTextStyles.metaLabel,),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroImage() {
    return Padding(
      padding: .only(top: 17),
      child: ClipRRect(
        borderRadius: .circular(NumberConstant.detailHeroRadius),
        child: SizedBox(
          height: NumberConstant.detailHeroHeight,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  recipe.imagePath,
                  fit: .cover,
                  width: double.infinity,
                  height: NumberConstant.detailHeroHeight,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 16,
                child: Center(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.imageBadgeColor,
                      borderRadius: .circular(NumberConstant.imageBadgeRadius),
                    ),
                    child: Padding(
                      padding: .symmetric(
                        horizontal: NumberConstant.imageBadgeHorizontalPadding,
                        vertical: NumberConstant.imageBadgeVerticalPadding,
                      ),
                      child: Text(StringConst.imagePageIndicator, style: AppTextStyles.imageBadge,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(RecipeDetailProvider provider) {
    final preview = recipe.description.length > 90
        ? '${recipe.description.substring(0, 90)}... '
        : '${recipe.description} ';

    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: .only(top: NumberConstant.detailDescriptionTopPadding),
          child: Text(StringConst.description, style: AppTextStyles.descriptionHeading,),
        ),
        Padding(
          padding: .only(top: 11),
          child: GestureDetector(
            onTap: provider.toggleDescription,
            child: provider.isDescriptionExpanded
                ? Text(recipe.description, style: AppTextStyles.descriptionBody,)
                : Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: preview, style: AppTextStyles.descriptionBody),
                        TextSpan(text: StringConst.showMore, style: AppTextStyles.showMore),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientsList() {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6,
      children: recipe.ingredients
          .map((ingredient) => Text('• $ingredient', style: AppTextStyles.accordionBody,))
          .toList(),
    );
  }

  Widget _buildAccordion({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required Widget child,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderColor)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          GestureDetector(
            onTap: onTap,
            behavior: .opaque,
            child: SizedBox(
              height: NumberConstant.accordionRowHeight,
              child: Row(
                children: [
                  Expanded(child: Text(title, style: AppTextStyles.accordionTitle,),),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: SvgPicture.asset(AssetRes.icChevronDown,),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: .only(bottom: 10),
              child: child,
            ),
        ],
      ),
    );
  }

  Widget _buildWatchVideoButton() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primaryGreenColor,
        borderRadius: .circular(NumberConstant.primaryButtonRadius),
      ),
      child: SizedBox(
        height: NumberConstant.primaryButtonHeight,
        child: Padding(
          padding: .symmetric(horizontal: NumberConstant.primaryButtonHorizontalPadding),
          child: Row(
            mainAxisSize: .min,
            spacing: 8,
            children: [
              SvgPicture.asset(AssetRes.icPlay,),
              Text(StringConst.watchVideo, style: AppTextStyles.primaryButton,),
            ],
          ),
        ),
      ),
    );
  }
}
