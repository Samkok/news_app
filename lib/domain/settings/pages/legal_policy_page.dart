import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';

class LegalPolicyPage extends StatefulWidget {
  const LegalPolicyPage({super.key});

  @override
  State<LegalPolicyPage> createState() => _LegalPolicyPageState();
}

class _LegalPolicyPageState extends State<LegalPolicyPage> {
  ScrollController scrollController = ScrollController();

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
            "Legal and Policy",
            style: themeData.textTheme.bodyLarge,
          ),
        ),
        backgroundColor: themeData.hintColor,
        body: RawScrollbar(
          interactive: true,
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 8,
          controller: scrollController,
          radius: const Radius.circular(10), // Rounded corners for the scrollbar
          thumbColor: ColorConst.mainColor,
          trackColor: ColorConst.g300,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.Updatss is your go-to source for staying informed and up-to-date with the latest news and information. Our mission is to provide reliable, unbiased news coverage across various topics, keeping you informed wherever you are. Whether it's breaking news, in-depth analysis, or trending stories, Updatss is dedicated to delivering accurate and timely content to our users. Join us as we strive to keep you connected to the world around you.",
                style: themeData.textTheme.bodySmall,
              ),
            ),
          ),
        )
    );
  }
}
