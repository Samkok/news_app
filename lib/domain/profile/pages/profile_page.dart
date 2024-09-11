import 'dart:math';

import 'package:demo/domain/auth/controller/auth_controller.dart';
import 'package:demo/domain/profile/controller/profile_controller.dart';
import 'package:demo/domain/article/model/article_model.dart';
import 'package:demo/domain/channel/model/channel_model.dart';
import 'package:demo/domain/home/models/user_model.dart';
import 'package:demo/utils/color_const.dart';
import 'package:demo/utils/route_name.dart';
import 'package:demo/utils/utils.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final profileController = Get.find<ProfileController>();
  final authController = Get.find<AuthController>();
  
  List<ArticleModel> articles = [
    ArticleModel(id: 1, category: "Technology", title: "Google Launch AI-Powered Virtual Assistance for business meetings", article: "article", publishedDate: "20240521", timeToRead: 9, img: "assets/article1.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 2, category: "International", title: "North Korea conduct missile test, prompting international concern", article: "article", publishedDate: "20240521", timeToRead: 54, img: "assets/article2.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 3, category: "Education", title: "Classroom Technology Debate Raises Questions About Digital Divide", article: "article", publishedDate: "20240721", timeToRead: 9, img: "assets/article3.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 4, category: "Sport", title: "NBA Finals: Los Angeles Lakers Clinch Championship Title in Thrilling Game 7", article: "article", publishedDate: "20240721", timeToRead: 20, img: "assets/article4.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
  ];

  UserModel loggedInUser = UserModel(id: 1, firstName: "Robert", lastName: "Fox", email: "robertfox@gmail.com", img: "assets/profile.png", cover: "assets/cover.png", articlesCount: 17, followers: 412, following: 130);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.hintColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.setting);
              },
              child: Icon(Icons.settings_outlined, color: themeData.colorScheme.onPrimary),
            ),
          )
        ],
        title: Text(
          "Profile",
          style: themeData.textTheme.bodyLarge,
        ),
      ),
      backgroundColor: themeData.hintColor,
      body: Center(
        child: Container(
          color: themeData.hintColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Info
              _profileInfo(themeData),

              // Filter
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // _filterItem(themeData, width/3 - 30, "All Articles"),
                    // _filterItem(themeData, width/3 - 30, "Article"),
                    // _filterItem(themeData, width/3 - 30, "Audio Articles"),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: UtilWidget.flexibleButtonFilled(
                            context, "All Article", () => ()),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: UtilWidget.flexibleButtonWithBorder(
                            context, "Article", () => ()),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: UtilWidget.flexibleButtonWithBorder(
                            context, "Audio Articles", () => ()),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      ArticleModel article = articles[index];
                      return _articleItem(article, themeData);
                    },
                  )
                )
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: () {
          Get.toNamed(RouteName.createUpdateArticle, arguments: null);
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: ColorConst.mainColor,
          child: Center(
            child: Icon(Icons.add, color: ColorConst.g200),
          ),
        ),
      ),
    );
  }

  _articleItem(ArticleModel article, ThemeData themeData) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: themeData.colorScheme.onPrimary)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: UtilWidget.loadImageFromAssetName(article.img),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(text: UtilWidget.linkText(
                    article.category,
                        ()=>(),
                    false,
                    themeData.primaryColor
                )),
                Text(
                  article.title,
                  style: themeData.textTheme.bodyMedium,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${Utils.dateFormat(article.publishedDate)} - ${article.timeToRead} min read",
                  style: TextStyle(
                      color: themeData.colorScheme.onPrimary,
                      fontSize: 10
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
          GestureDetector(
            child: UtilWidget.loadImageFromAssetNameWithColor("assets/edit.png", themeData.colorScheme.onPrimary),
            onTap: () {
              Get.toNamed(RouteName.createUpdateArticle, arguments: article);
            },
          )
        ],
      ),
    );
  }

  _filterItem(ThemeData themeData, double width, String label) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: width,
        decoration: BoxDecoration(
            color: themeData.primaryColor,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Text(
          textAlign: TextAlign.center,
          label,
          style: themeData.textTheme.bodySmall,
        ),
      ),
    );
  }

  _otherInfo({required ThemeData themeData, required String title, required int count}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("$count", style: TextStyle(
          color: themeData.primaryColor,
          fontWeight: FontWeight.bold
        )),
        Text(title, style: themeData.textTheme.bodySmall)
      ],
    );
  }

  _profileInfo(ThemeData themeData) {
    UserModel? loggedInUser = authController.loggedInUser.value!;
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: UtilWidget.loadImageFromAssetName(loggedInUser.cover),
            ),
            Positioned(
              bottom: 0,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                child: UtilWidget.loadImageFromAssetName(loggedInUser.img),
              ),
            )
          ],
        ),
        Center(
          child: Text(
              "${loggedInUser.firstName} ${loggedInUser.lastName}",
              style: themeData.textTheme.bodyLarge
          ),
        ),
        // Detail
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _otherInfo(themeData: themeData, title: "Articles", count: loggedInUser.articlesCount),
            _otherInfo(themeData: themeData, title: "Followers", count: loggedInUser.followers),
            _otherInfo(themeData: themeData, title: "Following", count: loggedInUser.following),
          ],
        ),
      ],
    );
  }

}
