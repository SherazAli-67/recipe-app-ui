import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui/constants/number_constant.dart';
import 'package:recipe_app_ui/constants/string_const.dart';
import 'package:recipe_app_ui/core/app_colors.dart';
import 'package:recipe_app_ui/core/app_data.dart';
import 'package:recipe_app_ui/core/app_textstyles.dart';
import 'package:recipe_app_ui/core/asset_res.dart';
import 'package:recipe_app_ui/core/models/recipe_model.dart';
import 'package:recipe_app_ui/presentation/widgets/circular_icon_button.dart';
import 'package:recipe_app_ui/presentation/widgets/fade_slide_in.dart';
import 'package:recipe_app_ui/presentation/widgets/recipe_card.dart';
import 'package:recipe_app_ui/providers/favorites_provider.dart';
import 'package:recipe_app_ui/routing/router.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FavoritesProvider>();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: NumberConstant.horizontalPadding),
          child: Column(
            children: [
              FadeSlideIn(delay: 0, child: _buildTopNav(context),),
              Expanded(
                child: ListView(
                  padding: .only(top: 5, bottom: 16),
                  children: AppData.favoriteCategories.asMap().entries.map((entry) {
                    final category = entry.value;
                    final isExpanded = provider.isExpanded(category);
                    final favorites = AppData.favoriteRecipesByCategory(category);
                    return FadeSlideIn(
                      delay: NumberConstant.animStaggerStep * (entry.key + 1),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          _buildAccordionRow(
                            title: category,
                            count: favorites.length,
                            isExpanded: isExpanded,
                            onTap: () => provider.toggleCategory(category),
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: NumberConstant.animMedium),
                            curve: Curves.easeOutCubic,
                            alignment: .topCenter,
                            child: ClipRect(
                              child: isExpanded
                                  ? _buildFavoritesGrid(context, provider, favorites)
                                  : const SizedBox(width: double.infinity),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
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
            onTap: () => context.go(NamedRoutes.home.routeName),
          ),
          Expanded(
            child: Text(StringConst.favoriteRecipes, style: AppTextStyles.topNavTitle, textAlign: .center,),
          ),
          Opacity(
            opacity: 0,
            child: CircularIconButton(iconPath: AssetRes.icBack,),
          ),
        ],
      ),
    );
  }

  Widget _buildAccordionRow({
    required String title,
    required int count,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: .opaque,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.borderColor)),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: NumberConstant.animFast),
          curve: Curves.easeOutCubic,
          height: isExpanded ? 53 : NumberConstant.accordionRowHeight,
          child: Row(
            children: [
              Text(title, style: AppTextStyles.accordionTitle,),
              Padding(
                padding: .only(left: NumberConstant.favoriteAccordionCountGap),
                child: Text('$count', style: AppTextStyles.accordionCount,),
              ),
              const Spacer(),
              AnimatedRotation(
                turns: isExpanded ? 0.25 : 0,
                duration: const Duration(milliseconds: NumberConstant.animFast),
                child: SvgPicture.asset(AssetRes.icChevronRight,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoritesGrid(
    BuildContext context,
    FavoritesProvider provider,
    List<RecipeModel> favorites,
  ) {
    if (favorites.isEmpty) {
      return const SizedBox(height: 24);
    }

    return Padding(
      padding: .only(top: 17, bottom: 8),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: NumberConstant.animMedium),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child,),
        child: GridView.builder(
          key: ValueKey(favorites.map((recipe) => recipe.id).join(',')),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: favorites.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: NumberConstant.favoriteCardGap,
            mainAxisSpacing: NumberConstant.favoriteGridRowGap,
            childAspectRatio: NumberConstant.favoriteCardWidth /
                (NumberConstant.favoriteCardImageHeight + 50),
          ),
          itemBuilder: (context, index) {
            final recipe = favorites[index];
            return FadeSlideIn(
              delay: index * NumberConstant.animStaggerStep,
              child: LayoutBuilder(
                builder: (context, constraints) => RecipeCard(
                  recipe: recipe,
                  width: constraints.maxWidth,
                  imageHeight: NumberConstant.favoriteCardImageHeight,
                  showTimeBadge: false,
                  showFavoriteButton: true,
                  useSmallTitle: true,
                  onTap: () => context.push(NamedRoutes.recipeDetailPath(recipe.id)),
                  onFavoriteTap: () => provider.toggleFavorite(recipe.id),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
