import 'package:demo/services/shared_preference_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {

  SharedPreferenceService sharedPreferenceService = SharedPreferenceService();

  RxBool isDarkMode = false.obs;

  Future<void> loadThemeMode() async {
    bool? savedIsDarkMode = await sharedPreferenceService.getBoolItem(SharedPrefKey.isDarkMode);
    if (savedIsDarkMode != null) {
      isDarkMode.value = savedIsDarkMode;
      Get.changeThemeMode(savedIsDarkMode ? ThemeMode.dark : ThemeMode.light);
    }
  }

  Future<void> saveThemeMode(bool isDark) async {
    sharedPreferenceService.setItem(SharedPrefKey.isDarkMode, isDark);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    saveThemeMode(isDarkMode.value);
    update();
  }

}