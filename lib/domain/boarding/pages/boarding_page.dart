import 'package:demo/domain/auth/controller/auth_controller.dart';
import 'package:demo/domain/boarding/controller/boarding_controller.dart';
import 'package:demo/domain/home/models/user_model.dart';
import 'package:demo/domain/home/pages/home_page.dart';
import 'package:demo/domain/profile/pages/profile_page.dart';
import 'package:demo/domain/saves/pages/saved_page.dart';
import 'package:demo/domain/search/pages/search_page.dart';
import 'package:demo/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {

  List items = [
    { "label": "Home", "icon": "assets/home_icon.png", "page": const HomePage() },
    { "label": "Explore", "icon": "assets/search_icon.png", "page": const SearchPage() },
    { "label": "List", "icon": "assets/save_icon.png", "page": const SavedPage() },
    { "label": "Profile", "icon": "assets/profile_icon.png", "page": const ProfilePage() },
  ];

  final boardingController = Get.find<BoardingController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);
    
    return GetBuilder<BoardingController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            color: themeData.hintColor,
            child: items[boardingController.selectedIndex.value]["page"],
          ),
          // Bottom bar
          bottomNavigationBar: Container(
            height: 75,
            decoration: BoxDecoration(
              color: themeData.hintColor,
            ),
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(items.length, (index) {
                return _bottomItem(index, themeData, () => ());
              }),
            ),
          ),
        );
      }
    );
  }

  _bottomItem(int index,ThemeData themeData, Function callback) {
    var item = items[index];
    Color color = boardingController.selectedIndex.value == index ? themeData.primaryColor : themeData.colorScheme.onPrimary;
    return GestureDetector(
        onTap: () => boardingController.changeSelectedIndex(index),
        child: Column(
          children: [
            Image(image: AssetImage(item["icon"]), color: color),
            Text(
                item["label"],
                style: TextStyle( color: color )
            )
          ],
        ),
    );
  }

}
