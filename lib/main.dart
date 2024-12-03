import 'package:anime_world/config/colors.dart';
import 'package:anime_world/providers/characters.dart';
import 'package:anime_world/providers/internet_checker.dart';
import 'package:anime_world/providers/random.dart';
import 'package:anime_world/providers/details_data.dart';
import 'package:anime_world/providers/navigation_index.dart';
import 'package:anime_world/providers/recommendation_img.dart';
import 'package:anime_world/providers/search_results.dart';
import 'package:anime_world/providers/top_rated.dart';
import 'package:anime_world/screens/details.dart';
import 'package:anime_world/screens/home.dart';
import 'package:anime_world/screens/search.dart';
import 'package:anime_world/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => RecommendationImg()),
          ChangeNotifierProvider(create: (context) => TopRated()),
          ChangeNotifierProvider(create: (context) => Popular()),
          ChangeNotifierProvider(create: (context) => SearchResults()),
          ChangeNotifierProvider(create: (context) => NavigationIndex()),
          ChangeNotifierProvider(create: (context) => DetailsData()),
          ChangeNotifierProvider(create: (context) => InternetChecker()),
          ChangeNotifierProvider(create: (context) =>CharactersProvider())
        ],
        builder: (context, child) => MaterialApp.router(
              // Turning off the click effect from BottomNavigationBar
              theme: ThemeData(
                splashFactory: NoSplash.splashFactory,
                splashColor: ColorsClass.dark,
                highlightColor: ColorsClass.dark,
              ),
              debugShowCheckedModeBanner: false,
              routerConfig: _routes,
            ));
  }
}

GoRouter _routes = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 400),
        child: const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: "/details",
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 400),
        child: const DetailsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: "/search",
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 300),
        child: const SearchScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: "/splash",
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 300),
        child: const SplashScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        ),
      ),
    ),
  ],
);
