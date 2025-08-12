import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rohid_boilerplate/app/navigation/app_router.dart';
import 'package:rohid_boilerplate/core/constants/app_values.dart';
import 'package:rohid_boilerplate/presentation/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          themeMode: ThemeMode.system,
          routerConfig: AppRouter.createRouter(),
        );
      },
      // No child is required when using MaterialApp.router
      child: const SizedBox.shrink(),
    );
  }
}
