import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rohid_boilerplate/app/navigation/app_routes.dart';
import 'package:rohid_boilerplate/app/viewmodel/app_viewmodel.dart';
import 'package:rohid_boilerplate/presentation/features/counter/screens/counter_screen.dart';
import 'package:rohid_boilerplate/presentation/features/dashboard/screens/dashboard_screen.dart';
import 'package:rohid_boilerplate/presentation/features/settings/screens/settings_screen.dart';
import 'package:rohid_boilerplate/presentation/features/splash/screens/splash_screen.dart';
import 'package:rohid_boilerplate/presentation/features/splash/states/app_startup_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'rootNavigator',
);

@riverpod
GoRouter router(Ref ref) {
  // Watch the authentication state
  final authState = ref.watch(appViewModelProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash.path,

    // The redirect logic is the key to solving the hot reload issue
    redirect: (BuildContext context, GoRouterState state) {
      // If the state is still loading, do nothing and stay on the splash screen.
      if (authState == AppStartupState.loading) {
        return AppRoutes.splash.path;
      }

      final isOnSplashScreen = state.matchedLocation == AppRoutes.splash.path;

      // If the auth check is complete and we are on the splash screen, redirect away.
      if (isOnSplashScreen) {
        if (authState == AppStartupState.authenticated) {
          return AppRoutes.dashboard.path;
        } else {
          // Redirect to login or home based on your app's logic.
          // For now, we'll stick to your original logic of going to counter.
          return AppRoutes.counter.path;
        }
      }

      // No redirect needed, user is on another screen.
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.splash.name,
        path: AppRoutes.splash.path,
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shellNavigator'),
        builder: (context, state, child) {
          return DashboardScreen(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            name: AppRoutes.counter.name,
            path: AppRoutes.counter.path,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: const CounterScreen(),
              );
            },
          ),
          GoRoute(
            name: AppRoutes.settings.name,
            path: AppRoutes.settings.path,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: const SettingsScreen(),
              );
            }
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Not found')),
      body: Center(child: Text(state.error?.toString() ?? 'Page not found')),
    ),
  );
}
