import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rohid_boilerplate/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_mode.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  Future<ThemeMode> build() async {
    final pref = await SharedPreferences.getInstance();
    final currentMode = pref.getString(Constants.themeModeKey);

    return ThemeMode.values.firstWhere(
      (value) => currentMode == value.name,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> updateMode(ThemeMode mode) async {
    state = AsyncData(mode);
    final pref = await SharedPreferences.getInstance();
    await pref.setString(Constants.themeModeKey, mode.name);
  }

}
