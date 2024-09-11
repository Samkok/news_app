import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/route_name.dart';
import '../../../utils/utils.dart';
import '../../../widgets/util_widget.dart';
import '../../article/model/article_model.dart';
import '../../channel/model/channel_model.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {

  List<ArticleModel> saves = [
    ArticleModel(id: 1, category: "Technology", title: "Google Launch AI-Powered Virtual Assistance for business meetings", article: "article", publishedDate: "20240521", timeToRead: 9, img: "assets/article1.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 2, category: "International", title: "North Korea conduct missile test, prompting international concern", article: "article", publishedDate: "20240521", timeToRead: 54, img: "assets/article2.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 3, category: "Education", title: "Classroom Technology Debate Raises Questions About Digital Divide", article: "article", publishedDate: "20240721", timeToRead: 9, img: "assets/article3.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 4, category: "Sport", title: "NBA Finals: Los Angeles Lakers Clinch Championship Title in Thrilling Game 7", article: "article", publishedDate: "20240721", timeToRead: 20, img: "assets/article4.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 4, category: "Sport", title: "NBA Finals: Los Angeles Lakers Clinch Championship Title in Thrilling Game 7", article: "article", publishedDate: "20240721", timeToRead: 20, img: "assets/article4.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 4, category: "Sport", title: "NBA Finals: Los Angeles Lakers Clinch Championship Title in Thrilling Game 7", article: "article", publishedDate: "20240721", timeToRead: 20, img: "assets/article4.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 4, category: "Sport", title: "NBA Finals: Los Angeles Lakers Clinch Championship Title in Thrilling Game 7", article: "article", publishedDate: "20240721", timeToRead: 20, img: "assets/article4.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 4, category: "Sport", title: "NBA Finals: Los Angeles Lakers Clinch Championship Title in Thrilling Game 7", article: "article", publishedDate: "20240721", timeToRead: 20, img: "assets/article4.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
    ArticleModel(id: 4, category: "Sport", title: "NBA Finals: Los Angeles Lakers Clinch Championship Title in Thrilling Game 7", article: "article", publishedDate: "20240721", timeToRead: 20, img: "assets/article4.png", channel: ChannelModel(name: "Samkok", img: "assets/profile.png")),
  ];

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
          "Saved",
          style: themeData.textTheme.bodyLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sort by
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Sort by",
                      style: themeData.textTheme.bodyMedium,
                    ),
                  ),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Most Recent",
                          style: themeData.textTheme.bodyMedium,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Icon(Icons.keyboard_arrow_down_outlined, color: themeData.colorScheme.onPrimary),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // List of saved
            Expanded(
              // height: MediaQuery.of(context).size.height,
              child: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListView.builder(
                  itemCount: saves.length,
                  itemBuilder: (context, index) {
                    ArticleModel save = saves[index];
                    return _savedItem(save, themeData);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _savedItem(ArticleModel article, ThemeData themeData) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: themeData.hintColor)
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            child: UtilWidget.loadImageFromAssetNameWithColor("assets/bookmark.png", themeData.primaryColor),
            onTap: () {
              Get.toNamed(RouteName.createUpdateArticle, arguments: article);
            },
          )
        ],
      ),
    );
  }
}
