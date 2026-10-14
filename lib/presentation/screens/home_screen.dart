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
                        _buildHeader(),
                        _buildHeroTitle(),
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
                          _buildSectionHeader(StringConst.recommendation),
                          _buildRecommendationList(context),
                          _buildSectionHeader(StringConst.recipeOfTheWeek),
                          _buildRecipeOfTheWeek(),
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
            child: Image.asset(
              AssetRes.avatarImg,
              width: NumberConstant.avatarSize,
              height: NumberConstant.avatarSize,
              fit: .cover,
            ),
          ),
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

  Widget _buildHeroTitle() {
    return Text(
      '${StringConst.heroTitleLine1}\n${StringConst.heroTitleLine2}',
      style: AppTextStyles.heroTitle,
    );
  }

  Widget _buildSearchField() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border(bottom: BorderSide(color: AppColors.searchBorderColor)),
      ),
      child: SizedBox(
        height: NumberConstant.searchFieldHeight,
        child: Padding(
          padding: .symmetric(horizontal: 14),
          child: Row(
            spacing: 14,
            children: [
              SvgPicture.asset(AssetRes.icSearch,),
              Expanded(
                child: Text(StringConst.searchHint, style: AppTextStyles.searchPlaceholder,),
              ),
              SvgPicture.asset(AssetRes.icFilter,),
            ],
          ),
        ),
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
          color: isSelected ? AppColors.primaryGreenColor : AppColors.whiteColor,
          borderRadius: .circular(NumberConstant.categoryChipRadius),
          border: .all(
            color: isSelected ? AppColors.primaryGreenColor : AppColors.borderColor,
          ),
        ),
        child: SizedBox(
          height: NumberConstant.categoryChipHeight,
          child: Padding(
            padding: .symmetric(horizontal: 13),
            child: Row(
              mainAxisSize: .min,
              spacing: 8,
              children: [
                if (!category.isSeeAll) Text(category.emoji, style: TextStyle(fontSize: NumberConstant.categoryEmojiSize),),
                Text(
                  category.name,
                  style: isSelected ? AppTextStyles.categoryChipSelected : AppTextStyles.categoryChip,
                ),
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

  Widget _buildRecipeOfTheWeek() {
    return Padding(
      padding: .only(top: 13, bottom: 24),
      child: Row(
        spacing: NumberConstant.weekImageGap,
        children: [
          Expanded(
            flex: 198,
            child: ClipRRect(
              borderRadius: .circular(NumberConstant.recipeCardRadius),
              child: Image.asset(
                AssetRes.recipeWeekLeftImg,
                height: NumberConstant.weekImageHeight,
                fit: .cover,
              ),
            ),
          ),
          Expanded(
            flex: 158,
            child: ClipRRect(
              borderRadius: .circular(NumberConstant.recipeCardRadius),
              child: Image.asset(
                AssetRes.recipeWeekRightImg,
                height: NumberConstant.weekImageHeight,
                fit: .cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

