import 'package:architecture/core/constants/app_routes.dart';
import 'package:architecture/presentation/detail/view/detail_view.dart';
import 'package:architecture/presentation/home/view/home.dart';
import 'package:architecture/presentation/login/view/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///Necessary to get the context anywhere and show the toast message
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// `GoRouterConfig` class holds the configuration for app-wide navigation using
///  GoRouter.
class GoRouterConfig {
  /// `routerConfig` is a static instance of `GoRouter` containing all route
  /// definitions and navigation logic.

  static final routerConfig = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.login,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        name: AppRoutes.login,
        path: AppRoutes.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.home,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        name: AppRoutes.detail,
        path: AppRoutes.detail,
        builder: (context, state) => DetailScreen(),
      ),
    ],
    errorBuilder: (context, state) => Center(
      child: Text('${state.error}'),
    ),
  );
}
