import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rohid_boilerplate/app/navigation/app_routes.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Counter'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int index) => _onItemTapped(index, context),
      ),
    );
  }

  // This is the corrected method
  int _calculateSelectedIndex(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    // Get the current location path
    final String location = state.uri.toString();

    // Check if the location starts with the path of our routes
    if (location.startsWith(AppRoutes.counter.path)) {
      return 0;
    }
    if (location.startsWith(AppRoutes.settings.path)) {
      return 1;
    }
    return 0;
  }

  // This method is already correct
  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.counter.name);
        break;
      case 1:
        context.goNamed(AppRoutes.settings.name);
        break;
    }
  }
}