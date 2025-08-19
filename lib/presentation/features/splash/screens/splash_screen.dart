import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rohid_boilerplate/core/constants/app_images.dart';
import 'package:rohid_boilerplate/core/constants/app_values.dart';
import 'package:rohid_boilerplate/presentation/common_widgets/asset_image_builder.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppValues.dimen_100),
          child: AssetImageBuilder(AppImages.appIcon,
          height: AppValues.dimen_150.h,
          width: AppValues.dimen_150.w,
          fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
