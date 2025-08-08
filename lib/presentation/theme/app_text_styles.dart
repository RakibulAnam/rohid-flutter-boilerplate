import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rohid_boilerplate/core/constants/app_values.dart'; // Import the package

class AppTextStyles {
  AppTextStyles._();

  //The TextStyles are defined here according to material 3 guidelines.
  // Can be changed according to design typography

  static const String _fontFamily = 'Poppins';

  // --- DISPLAY STYLES ---
  static TextStyle get displayLarge => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppValues.dimen_57.sp, // Use .sp
  );

  static TextStyle get displayMedium => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppValues.dimen_45.sp, // Use .sp
  );

  static TextStyle get displaySmall => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppValues.dimen_36.sp, // Use .sp
  );

  // --- HEADLINE STYLES ---
  static TextStyle get headlineLarge => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppValues.dimen_32.sp, // Use .sp
  );

  static TextStyle get headlineMedium => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppValues.dimen_28.sp, // Use .sp
  );

  static TextStyle get headlineSmall => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppValues.dimen_24.sp, // Use .sp
  );

  // --- TITLE STYLES ---
  static TextStyle get titleLarge => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppValues.dimen_22.sp, // Use .sp
  );

  static TextStyle get titleMedium => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: AppValues.dimen_16.sp, // Use .sp
    letterSpacing: 0.15,
  );

  static TextStyle get titleSmall => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: AppValues.dimen_14.sp, // Use .sp
  );

  // --- BODY STYLES ---
  static TextStyle get bodyLarge => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppValues.dimen_16.sp, // Use .sp
    letterSpacing: 0.5,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppValues.dimen_14.sp, // Use .sp
    letterSpacing: 0.25,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: AppValues.dimen_12.sp, // Use .sp
    letterSpacing: 0.4,
  );

  // --- LABEL STYLES ---
  static TextStyle get labelLarge => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: AppValues.dimen_14.sp, // Use .sp
    letterSpacing: 0.1,
  );

  static TextStyle get labelMedium => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: AppValues.dimen_12.sp, // Use .sp
    letterSpacing: 0.5,
  );

  static TextStyle get labelSmall => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: AppValues.dimen_11.sp, // Use .sp
    letterSpacing: 0.5,
  );


  // --- ITALIC VARIATIONS ---
  // A getter can call another getter
  static TextStyle get titleLargeItalic =>
      titleLarge.copyWith(fontStyle: FontStyle.italic);

  static TextStyle get bodyMediumItalic =>
      bodyMedium.copyWith(fontStyle: FontStyle.italic);
}

extension CustomTextStyles on TextTheme {

  TextStyle get titleLargeItalic => AppTextStyles.titleLargeItalic;
  TextStyle get bodyMediumItalic => AppTextStyles.bodyMediumItalic;

}
