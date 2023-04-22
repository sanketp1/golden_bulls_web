import 'package:flutter/material.dart';
import 'package:golden_bulls_web_production/app/constant/font.dart';
import 'package:golden_bulls_web_production/app/constant/appColor.dart';

class AppTheme {
  static final appTheme = ThemeData(
      primaryColor: AppColor.primaryColor,
      fontFamily: AppFont.primaryFont.fontFamily,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColor.primaryColor,
        refreshBackgroundColor: Colors.white,
      ),



//setting up the bottom navaigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.primaryColor,
          selectedItemColor: AppColor.secondaryColor,
          unselectedItemColor: Colors.white),
      appBarTheme: AppBarTheme(
          color: AppColor.primaryColor,
          titleTextStyle:
              AppFont.primaryFont.copyWith(color: Colors.white, fontSize: 20),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColor.primaryColor,
              elevation: 1,
              textStyle: AppFont.primaryFont
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w500))),
      inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: AppColor.primaryColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(width: 1.5, color: AppColor.primaryColor))));
}
