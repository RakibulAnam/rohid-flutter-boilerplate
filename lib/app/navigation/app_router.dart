import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rohid_boilerplate/app/navigation/app_routes.dart';
import 'package:rohid_boilerplate/presentation/features/counter/screens/counter_screen.dart';

/// Centralized router for the app using go_router
class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');

  static GoRouter createRouter() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: AppRoute.counter.path,
      routes: <RouteBase>[
        GoRoute(
          name: AppRoute.counter.name,
          path: AppRoute.counter.path,
          builder: (context, state) => const CounterScreen(),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Not found')),
        body: Center(child: Text(state.error?.toString() ?? 'Page not found')),
      ),
    );
  }
}
