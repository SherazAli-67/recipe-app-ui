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
import 'package:recipe_app_ui/core/models/category_model.dart';
import 'package:recipe_app_ui/core/models/recipe_model.dart';
import 'package:recipe_app_ui/presentation/widgets/circular_icon_button.dart';
import 'package:recipe_app_ui/presentation/widgets/fade_slide_in.dart';
import 'package:recipe_app_ui/presentation/widgets/recipe_card.dart';
import 'package:recipe_app_ui/providers/home_provider.dart';
import 'package:recipe_app_ui/routing/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.sizeOf(context).height * 0.38,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [
                    AppColors.mintStartColor,
                    AppColors.mintMidColor,
                    AppColors.whiteColor,
                  ],
                  stops: const [0, 0.72, 1],
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: .symmetric(horizontal: NumberConstant.horizontalPadding),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: 18,
                      children: [
                        FadeSlideIn(delay: 0, child: _buildHeader(),),
                        FadeSlideIn(
                          delay: NumberConstant.animStaggerStep,
                          child: Text('${StringConst.heroTitleLine1}\n${StringConst.heroTitleLine2}', style: AppTextStyles.heroTitle,),
                        ),
                        FadeSlideIn(delay: NumberConstant.animStaggerStep * 2, child: _buildSearchField(),),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: .only(top: NumberConstant.homeContentTopPadding),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          FadeSlideIn(delay: NumberConstant.animStaggerStep * 3, child: _buildCategoryChips(context),),
                          FadeSlideIn(delay: NumberConstant.animStaggerStep * 4, child: _buildSectionHeader(StringConst.recommendation),),
                          FadeSlideIn(delay: NumberConstant.animStaggerStep * 4, child: _buildRecommendationList(context),),
                          FadeSlideIn(delay: NumberConstant.animStaggerStep * 5, child: _buildSectionHeader(StringConst.recipeOfTheWeek),),
                          FadeSlideIn(delay: NumberConstant.animStaggerStep * 5, child: _buildRecipeOfTheWeek(context),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: .only(top: 4),
      child: Row(
        spacing: 13,
        crossAxisAlignment: .start,
        children: [
          ClipOval(child: Image.asset(AssetRes.avatarImg, height: NumberConstant.avatarSize, fit: .cover,),),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(StringConst.goodMorning, style: AppTextStyles.greetingLabel,),
                Text(StringConst.userName, style: AppTextStyles.userName,),
              ],
            ),
          ),
          CircularIconButton(iconPath: AssetRes.icDrawer,),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: NumberConstant.searchFieldHeight,
      padding: .symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .circular(NumberConstant.searchRadius),
      ),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: TextField(
              style: AppTextStyles.searchPlaceholder,
              cursorColor: AppColors.primaryGreenColor,
              decoration: InputDecoration(
                isDense: true,
                border: .none,
                hintText: StringConst.searchHint,
                hintStyle: AppTextStyles.searchPlaceholder,
                contentPadding: .zero,
              ),
            ),
          ),
          SvgPicture.asset(AssetRes.icSearch,),
        ],
      ),
    );
  }

  Widget _buildCategoryChips(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return SingleChildScrollView(
      scrollDirection: .horizontal,
      child: Row(
        spacing: NumberConstant.categoryChipGap,
        children: List.generate(
          AppData.categories.length,
          (index) => _buildCategoryChip(
            category: AppData.categories[index],
            isSelected: provider.selectedCategoryIndex == index,
            onTap: () => provider.selectCategory(index),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip({
    required CategoryModel category,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: NumberConstant.animFast),
        curve: Curves.easeOutCubic,
        height: NumberConstant.categoryChipHeight,
        padding: .symmetric(horizontal: 13),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreenColor : AppColors.whiteColor,
          borderRadius: .circular(NumberConstant.categoryChipRadius),
          border: .all(color: isSelected ? AppColors.primaryGreenColor : AppColors.borderColor,),
        ),
        child: Row(
          mainAxisSize: .min,
          spacing: 8,
          children: [
            if (!category.isSeeAll) Text(category.emoji, style: TextStyle(fontSize: NumberConstant.categoryEmojiSize),),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: NumberConstant.animFast),
              curve: Curves.easeOutCubic,
              style: isSelected ? AppTextStyles.categoryChipSelected : AppTextStyles.categoryChip,
              child: Text(category.name,),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: .only(top: NumberConstant.sectionHeaderTopPadding),
      child: Row(
        children: [
          Expanded(child: Text(title, style: AppTextStyles.sectionTitle,),),
          Text(StringConst.seeAll, style: AppTextStyles.seeAll,),
        ],
      ),
    );
  }

  Widget _buildRecommendationList(BuildContext context) {
    final categoryIndex = context.watch<HomeProvider>().selectedCategoryIndex;
    final recipes = _recommendationsFor(categoryIndex);

    return Padding(
      padding: .only(top: 13),
      child: SizedBox(
        height: NumberConstant.recipeCardImageHeight + 49,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: NumberConstant.animMedium),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween(begin: const Offset(0.04, 0), end: Offset.zero).animate(animation),
              child: child,
            ),
          ),
          child: ListView.separated(
            key: ValueKey(categoryIndex),
            scrollDirection: .horizontal,
            itemCount: recipes.length,
            separatorBuilder: (context, index) => const SizedBox(width: NumberConstant.recipeCardGap),
            itemBuilder: (context, index) => RecipeCard(
              recipe: recipes[index],
              onTap: () => context.push(NamedRoutes.recipeDetailPath(recipes[index].id)),
            ),
          ),
        ),
      ),
    );
  }

  List<RecipeModel> _recommendationsFor(int categoryIndex) {
    final category = AppData.categories[categoryIndex];
    if (category.isSeeAll) return AppData.recommendations;
    final filtered = AppData.recipesByCategory(category.name);
    return filtered.isEmpty ? AppData.recommendations : filtered;
  }

  Widget _buildRecipeOfTheWeek(BuildContext context) {
    final recipes = AppData.recipesOfTheWeek;

    return Padding(
      padding: .only(top: 13, bottom: 24),
      child: SizedBox(
        height: NumberConstant.recipeCardImageHeight + 49,
        child: ListView.separated(
          scrollDirection: .horizontal,
          itemCount: recipes.length,
          separatorBuilder: (context, index) => const SizedBox(width: NumberConstant.recipeCardGap),
          itemBuilder: (context, index) => RecipeCard(
            recipe: recipes[index],
            onTap: () => context.push(NamedRoutes.recipeDetailPath(recipes[index].id)),
          ),
        ),
      ),
    );
  }
}
