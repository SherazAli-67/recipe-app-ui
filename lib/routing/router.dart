import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui/presentation/screens/home_screen.dart';

GoRouter router = GoRouter(
    initialLocation: NamedRoutes.home.routeName,
    routes: [
      GoRoute(path: NamedRoutes.home.routeName, builder: (ctx, state) => HomeScreen())
    ]);

enum NamedRoutes {
  home('/home');

  final String routeName;
  const NamedRoutes(this.routeName);
}