import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui/presentation/screens/home_screen.dart';
import 'package:recipe_app_ui/presentation/screens/main_shell.dart';
import 'package:recipe_app_ui/presentation/screens/profile_screen.dart';
import 'package:recipe_app_ui/presentation/screens/saved_screen.dart';
import 'package:recipe_app_ui/presentation/screens/search_screen.dart';
import 'package:recipe_app_ui/providers/home_provider.dart';

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
              builder: (context, state) => const SavedScreen(),
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
  ],
);

enum NamedRoutes {
  home('/home'),
  search('/search'),
  saved('/saved'),
  profile('/profile');

  final String routeName;
  const NamedRoutes(this.routeName);
}
