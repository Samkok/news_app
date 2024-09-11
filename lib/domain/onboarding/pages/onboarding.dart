import 'package:demo/domain/auth/pages/signin/sign_in.dart';
import 'package:demo/utils/color_const.dart';
import 'package:demo/utils/route_name.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/pages/signup/sign_up.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {

  List items = [
    { "title" : "Explore the App", "img": "assets/iphone14.png", "desc" : "Our intuitive interface allows you to quickly and easily browse through categories, search for products, and add items.\n" },
    { "title" : "Custom your profile", "img": "assets/iphone14.png",  "desc" : "Our intuitive interface allows you to quickly and easily browse through categories, search for products, and add items.\n" },
    { "title" : "Find your favorite channel", "img": "assets/iphone14.png",  "desc" : "Our intuitive interface allows you to quickly and easily browse through categories, search for products, and add items.\n" }
  ];

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(
      initialIndex: 0,
      length: items.length,
      vsync: this
    );
    tabController.addListener(() {
      setState(() { });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    FocusScope.of(context).unfocus();
    double padding = 15;
    double width = MediaQuery.of(context).size.width - padding*2;

    return Container(
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Carousel view

          Expanded(
            flex: 10,
            child: SizedBox(
              width: width,
              child: Stack(
                alignment: const Alignment(0, 0),
                fit: StackFit.loose,
                children: [
                  TabBarView(
                    controller: tabController,
                    children: items.map((item) {
                      return Container(
                        child: UtilWidget.loadImageFromAssetName(item["img"]),
                      );
                    }).toList(),
                  ),
                  _tabViewItem(
                      context,
                      width,
                      items[tabController.index]["img"],
                      items[tabController.index]["title"],
                      items[tabController.index]["desc"],
                    themeData
                  ),
                ],
              ),
            ),
          ),

          // Term and privacy
          Expanded(
            flex: 1,
            child: _termAndPrivacy(context, width),
          )
        ],
      ),
    );
  }
  
  _termAndPrivacy(BuildContext context, double width) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Use term
          RichText(text: UtilWidget.linkText(
              "Use Term",
              useTermCallback(),
              false,
              ColorConst.background
          )),

          // Privacy
          RichText(text: UtilWidget.linkText(
              "Privacy",
              privacyCallback(),
              false,
              ColorConst.background))
        ],
      ),
    );
  }

  _tabViewItem(
      BuildContext context,
      double width,
      String assetName,
      String label,
      String desc,
      ThemeData themeData
    ) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: width,
        padding: const EdgeInsets.only(top: 15, bottom: 30, left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themeData.hoverColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Three dots
            _dotController(tabController),

            // Main title
            Text(
              label,
              style: themeData.textTheme.bodyLarge,
            ),
            // Description
            Text(
              desc,
              textAlign: TextAlign.center,
              style: themeData.textTheme.bodyMedium,
            ),
            // Sign in
            UtilWidget.buttonFilled(context, width, "SIGN IN", () => Get.toNamed(RouteName.signIn)),

            const SizedBox(height: 20,),

            // Create account
            UtilWidget.buttonWithBorder(context: context, width, "CREATE ACCOUNT", () => Get.toNamed(RouteName.signUp))
          ],
        ),
      ),
    );
  }

  _dotController(TabController tabController) {
    return Container(
      width: 80,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Selected
            Container(
              height: 10,
              width: tabController.index == 0 ? 30 : 10,
              decoration: tabController.index == 0 ? BoxDecoration(
                  color: ColorConst.mainColor,
                  borderRadius: BorderRadius.circular(10)
              ) : BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            // Normal
            Container(
              height: 10,
              width: tabController.index == 1 ? 30 : 10,
              decoration: tabController.index == 1 ? BoxDecoration(
                  color: ColorConst.mainColor,
                  borderRadius: BorderRadius.circular(10)
              ) : BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            // Normal
            Container(
              height: 10,
              width: tabController.index == 2 ? 30 : 10,
              decoration: tabController.index == 2 ? BoxDecoration(
                  color: ColorConst.mainColor,
                  borderRadius: BorderRadius.circular(10)
              ) : BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Function useTermCallback() {
    return () => print("Use term");
  }

  Function privacyCallback() {
    return () => print("Privacy");
  }

}
