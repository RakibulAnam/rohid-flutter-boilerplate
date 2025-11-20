import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rohid_boilerplate/app/navigation/app_routes.dart';
import 'package:rohid_boilerplate/app/viewmodel/app_viewmodel.dart';
import 'package:rohid_boilerplate/presentation/features/counter/screens/counter_screen.dart';
import 'package:rohid_boilerplate/presentation/features/dashboard/screens/dashboard_screen.dart';
import 'package:rohid_boilerplate/presentation/features/settings/screens/settings_screen.dart';
import 'package:rohid_boilerplate/presentation/features/splash/screens/splash_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'rootNavigator',
);

@riverpod
GoRouter router(Ref ref) {
  // Watch the authentication state


  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash.path,
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
