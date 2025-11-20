import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rohid_boilerplate/app/navigation/app_router.dart';
import 'package:rohid_boilerplate/core/constants/app_values.dart';
import 'package:rohid_boilerplate/presentation/theme/app_theme.dart';

import '../presentation/theme/appThemeMode/app_theme_mode.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final GoRouter router = ref.watch(routerProvider);
    final themeMode = ref.watch(appThemeModeProvider).value ?? ThemeMode.system;
    return ScreenUtilInit(
      designSize: const Size(AppValues.defaultWidth, AppValues.defaultHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          themeMode: themeMode,
          routerConfig: router,
        );
      },
    );
  }
}
