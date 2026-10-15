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
              /*  gradient: LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [
                    AppColors.mintStartColor,
                    AppColors.mintMidColor,
                    AppColors.whiteColor,
                  ],
                  stops: const [0, 0.72, 1],
                ),*/
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
                        _buildHeader(),
                        //${StringConst.heroTitleLine1}\n${StringConst.heroTitleLine2}, heroTitle
                        _buildSearchField(),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: .only(top: NumberConstant.homeContentTopPadding),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          _buildCategoryChips(context),
                          //sectionHeader(recommendation)
                          _buildRecommendationList(context),
                          //sectionHeader(recipesOfTheWeek)
                          _buildRecipeOfTheWeek(context),
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
          ClipOval(

            //avatarImg, avatarSize, .fit.cover
            child: const SizedBox()
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                //goodMorning, greetingLabel
                //userName, userName
              ],
            ),
          ),

          // CircularIconButton(iconPath: AssetRes.icDrawer,),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: NumberConstant.searchFieldHeight,
      padding: .symmetric(horizontal: 20),
      decoration: BoxDecoration(
        // color: AppColors.whiteColor,
        // borderRadius: .circular(NumberConstant.searchRadius),
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
                hintText: '',
                hintStyle: AppTextStyles.searchPlaceholder,
                contentPadding: .zero,
              ),
            ),
          ),
          //icSearch
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
      child: DecoratedBox(
        decoration: BoxDecoration(
          // color: isSelected ? AppColors.primaryGreenColor : AppColors.whiteColor,
          // borderRadius: .circular(NumberConstant.categoryChipRadius),
          // border: .all(color: isSelected ? AppColors.primaryGreenColor : AppColors.borderColor,),
        ),
        child: SizedBox(
          height: NumberConstant.categoryChipHeight,
          child: Padding(
            padding: .symmetric(horizontal: 13),
            child: Row(
              mainAxisSize: .min,
              spacing: 8,
              children: [
                if (!category.isSeeAll)
                  //category.emoji, categoryEmojiSize
                  const SizedBox(),
                //category.name, isSelected ? categoryChipSelected : categoryChip

              ],
            ),
          ),
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
    final recipes = _recommendationsFor(context.watch<HomeProvider>().selectedCategoryIndex);

    return Padding(
      padding: .only(top: 13),
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

