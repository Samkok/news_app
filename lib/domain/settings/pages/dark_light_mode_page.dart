import 'package:demo/domain/settings/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';

class DarkLightModePage extends StatefulWidget {
  const DarkLightModePage({super.key});

  @override
  State<DarkLightModePage> createState() => _DarkLightModePageState();
}

class _DarkLightModePageState extends State<DarkLightModePage> {

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.hintColor,
      appBar: AppBar(
        backgroundColor: themeData.hintColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
              Icons.arrow_back,
              color: themeData.colorScheme.onPrimary
          ),
        ),
        centerTitle: true,
        title: Text(
          "Dark / Light Mode",
          style: themeData.textTheme.bodyLarge,
        ),
      ),
      body: GetBuilder<ThemeController>(
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  themeController.isDarkMode.value ? "Switch to light mode" : "Switch to dark mode",
                  style: themeData.textTheme.bodyMedium,
                ),

                Switch(
                  value: themeController.isDarkMode.value,
                  onChanged: (value) => themeController.toggleTheme(),
                  inactiveThumbColor: ColorConst.mainColor,
                  activeTrackColor: ColorConst.g300,
                  activeColor: ColorConst.g900,
                  inactiveTrackColor: ColorConst.g300,
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
