import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui/constants/string_const.dart';
import 'package:recipe_app_ui/core/app_data.dart';
import 'package:recipe_app_ui/core/app_textstyles.dart';
import 'package:recipe_app_ui/presentation/screens/home_screen.dart';
import 'package:recipe_app_ui/presentation/screens/main_shell.dart';
import 'package:recipe_app_ui/presentation/screens/profile_screen.dart';
import 'package:recipe_app_ui/presentation/screens/recipe_detail_screen.dart';
import 'package:recipe_app_ui/presentation/screens/favorites_screen.dart';
import 'package:recipe_app_ui/presentation/screens/search_screen.dart';
import 'package:recipe_app_ui/providers/favorites_provider.dart';
import 'package:recipe_app_ui/providers/home_provider.dart';
import 'package:recipe_app_ui/providers/recipe_detail_provider.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.home.routeName,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.home.routeName,
              builder: (context, state) => ChangeNotifierProvider(
                create: (_) => HomeProvider(),
                child: const HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.search.routeName,
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.saved.routeName,
              builder: (context, state) => ChangeNotifierProvider(
                create: (_) => FavoritesProvider(),
                child: const FavoritesScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NamedRoutes.profile.routeName,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: NamedRoutes.recipeDetail.routeName,
      builder: (context, state) {
        final recipe = AppData.recipeById(state.pathParameters['id'] ?? '');
        if (recipe == null) {
          return Scaffold(
            body: Center(child: Text(StringConst.recipeNotFound, style: AppTextStyles.topNavTitle,),),
          );
        }
        return ChangeNotifierProvider(
          create: (_) => RecipeDetailProvider(),
          child: RecipeDetailScreen(recipe: recipe),
        );
      },
    ),
  ],
);

enum NamedRoutes {
  home('/home'),
  search('/search'),
  saved('/saved'),
  profile('/profile'),
  recipeDetail('/recipe/:id');

  final String routeName;
  const NamedRoutes(this.routeName);

  static String recipeDetailPath(String id) => '/recipe/$id';
}
