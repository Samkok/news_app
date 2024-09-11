import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeData.hintColor,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, color: themeData.colorScheme.onPrimary),
          ),
          centerTitle: true,
          title: Text(
            "Privacy",
            style: themeData.textTheme.bodyLarge,
          ),
        ),
        backgroundColor: themeData.hintColor,
        body: Container()
    );
  }
}
