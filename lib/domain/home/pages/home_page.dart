import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/utils/route_name.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';
import '../../auth/controller/auth_controller.dart';
import '../../article/model/article_model.dart';
import '../../channel/model/channel_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  List<ArticleModel> newsList = [
    ArticleModel(id: 1, category: "Business", title: "Innovative in Business: The Future of Ecommerce", article: "article", publishedDate: "20240521", timeToRead: 9, img: "assets/caro1.png", channel: ChannelModel(name: "BBC News", img: "assets/bbc.png")),
    ArticleModel(id: 2, category: "Sport", title: "Highlights from The World  of Athlectics", article: "article", publishedDate: "20240521", timeToRead: 54, img: "assets/caro2.png", channel: ChannelModel(name: "Forbes", img: "assets/forbes.png")),
  ];

  List<String> tags = [
    "#news", "#today", "#stock", "#crypto", "#business", "#music", "#marketing",
    "#game", "#crypto", "#lifestyle", "technology", "#forex"
  ];

  List<ArticleModel> popNews = [
    ArticleModel(id: 1, category: "Environment", title: "Water Scarcity Crisis: Strategies for Sustainable Business", article: "article", publishedDate: "20240521", timeToRead: 9, img: "assets/pop1.png", channel: ChannelModel(name: "Fox", img: "assets/foxnews.png")),
    ArticleModel(id: 2, category: "Business", title: "Global Market Volatility: Investors Brace for Uncertainty", article: "article", publishedDate: "20240521", timeToRead: 54, img: "assets/pop2.png", channel: ChannelModel(name: "BBC News", img: "assets/bbc.png")),
    ArticleModel(id: 3, category: "Business", title: "Innovative in Business: The Future of Ecommerce", article: "article", publishedDate: "20240521", timeToRead: 54, img: "assets/pop3.png", channel: ChannelModel(name: "BBC News", img: "assets/bbc.png")),
    ArticleModel(id: 3, category: "Business", title: "Innovative in Business: The Future of Ecommerce", article: "article", publishedDate: "20240521", timeToRead: 54, img: "assets/pop4.png", channel: ChannelModel(name: "BBC News", img: "assets/bbc.png")),
    ArticleModel(id: 3, category: "Business", title: "Innovative in Business: The Future of Ecommerce", article: "article", publishedDate: "20240521", timeToRead: 54, img: "assets/pop5.png", channel: ChannelModel(name: "BBC News", img: "assets/bbc.png")),
    ArticleModel(id: 3, category: "Business", title: "Innovative in Business: The Future of Ecommerce", article: "article", publishedDate: "20240521", timeToRead: 54, img: "assets/pop6.png", channel: ChannelModel(name: "BBC News", img: "assets/bbc.png")),
  ];

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    ThemeData themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            themeData.primaryColor,
            themeData.hintColor,
            themeData.hintColor,
            themeData.hintColor,
            themeData.hintColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // App bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: authController.loggedInUser.value != null ? UtilWidget.loadImageFromAssetName(authController.loggedInUser.value!.img) :const Icon(Icons.person),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Ensures the height adjusts to content
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome back',
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: themeData.textTheme.bodyMedium),
                        Text(authController.loggedInUser.value?.firstName ?? "Stark",
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: themeData.textTheme.bodyLarge),
                      ],
                    ),
                  )
                ],
              ),
              GestureDetector(
                child: Icon(Icons.notifications_none_outlined, color: themeData.colorScheme.onPrimary),
                onTap: () => Get.toNamed(RouteName.notification),
              )
            ],
          ),
          // Fixed
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Fixed header bar
              Wrap(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: themeData.textTheme.labelLarge,
                            children: [
                              const TextSpan(
                                text: "There are "
                              ),
                              TextSpan(
                                text: "12 newest ",
                                style: TextStyle(
                                  color: ColorConst.mainColor
                                )
                              ),
                              const TextSpan(
                                  text: "articles for you!"
                              ),
                            ]
                          ),
                        ),
                        // Search
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          height: 50,
                          child: LayoutBuilder(
                            builder: (_, constrain) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: UtilWidget.textFieldWithPrefix(
                                      context: context,
                                        hintText: "Search title...",
                                        controller: searchController,
                                        width: width,
                                        focusNode: searchFocusNode,
                                        callback: () => (),
                                        onChanged: (value) => (),
                                        prefix: Icon(Icons.search, color: ColorConst.g400, size: 20,),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: GestureDetector(
                                      child: Container(
                                        width: constrain.maxHeight,
                                        height: constrain.maxHeight,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: themeData.colorScheme.onPrimary
                                          )
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: themeData.hoverColor,
                                          child: Center(
                                            child: UtilWidget.loadImageFromAssetName("assets/microphone.png"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }
                          ),
                        ),

                        // Tags
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              channelBox(themeData, "BBC", "assets/bbc.png"),
                              channelBox(themeData, "RTE", "assets/rte.png"),
                              channelBox(themeData, "ITV", "assets/itv.png"),
                              channelBox(themeData, "Forbes", "assets/forbes.png"),
                              channelBox(themeData, "Fox", "assets/foxnews.png"),
                              channelBox(themeData, "Others", "assets/others.png", callback: () => Get.toNamed(RouteName.channel)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // Scrollable
            ],
          ),
          // Scrollable
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO: Breaking news
                  breakingNews(themeData, width),

                  // TODO: Tags
                  tagsView(themeData, width),

                  // TODO: Popular News
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    // color: Colors.green,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular News",
                              style: themeData.textTheme.bodyLarge,
                            ),
                            RichText(
                              text: UtilWidget.linkText(
                                  "View More",
                                      () => (),
                                  false,
                                  themeData.colorScheme.onPrimary
                              ),
                            )
                          ],
                        ),
                        // Grid view
                        Flexible(
                          // height: 300,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.8
                            ),
                            itemBuilder: (ctx, index) {
                              return popularNewsItem(themeData, popNews[index]);
                            },
                            itemCount: popNews.length,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  popularNewsItem(ThemeData themeData, ArticleModel news) {
    return Wrap(
      clipBehavior: Clip.none,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Image(
            image: AssetImage(news.img),
            fit: BoxFit.fill,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: UtilWidget.linkText(
                      news.category,
                      () => (),
                      false,
                      themeData.primaryColor
                    )
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: themeData.colorScheme.onPrimary, size: 15),
                    Text(
                      " 30 mn ago",
                      style: themeData.textTheme.bodySmall,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            )
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            news.title,
            // "Title",
            style: themeData.textTheme.bodyMedium,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: themeData.hoverColor,
                    border: Border.all(color: themeData.colorScheme.onPrimary)
                ),
                child: UtilWidget.loadImageFromAssetName(news.channel.img),
              ),
              Expanded(
                child: Text(
                  news.channel.name,
                  style: themeData.textTheme.bodySmall,
                ),
              ),
              GestureDetector(
                child: UtilWidget.loadImageFromAssetNameWithColor(
                    "assets/others.png", themeData.colorScheme.onPrimary
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  tagsView(ThemeData themeData, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Tags",
          style: themeData.textTheme.bodyLarge,
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            width: width,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(tags.length, (index) {
                String tag = tags[index];
                return tagItem(themeData, tag);
              }
              ),
            )
        )
      ],
    );
  }

  tagItem(ThemeData themeData, String tag) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteName.tag),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: themeData.hoverColor
            )
        ),
        child: Text(
          tag,
          style: themeData.textTheme.bodySmall,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
  
  breakingNews(ThemeData themeData, double width) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          // Title
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Breaking News",
                  style: themeData.textTheme.bodyLarge,
                ),
                RichText(
                  text: UtilWidget.linkText(
                    "View More",
                    () => (),
                    false,
                    themeData.colorScheme.onPrimary
                  ),
                )
              ],
            ),
          ),
          // Breaking news
          CarouselSlider.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index, realIndex) {
              ArticleModel news = newsList[index];
              return breakingNewsItem(themeData, width, news);
            },
            options: CarouselOptions(
              padEnds: false,
              enlargeCenterPage: false,
              autoPlay: false,
              aspectRatio: 1.15,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 0.8,
            ),
          )
        ],
      ),
    );
  }

  breakingNewsItem(ThemeData themeData, double width, ArticleModel news) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteName.detailArticle),
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: 150,
              child: Image(
                image: AssetImage(news.img),
                fit: BoxFit.fill,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(text: UtilWidget.linkText(
                        news.category,
                            () => (),
                        false,
                        themeData.primaryColor)
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: themeData.colorScheme.onPrimary),
                        Text(
                          "   30 min ago",
                          style: themeData.textTheme.bodySmall,
                        )
                      ],
                    )
                  ],
                )
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                news.title,
                style: themeData.textTheme.bodyLarge,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themeData.hoverColor,
                          border: Border.all(color: themeData.colorScheme.onPrimary)
                      ),
                      child: UtilWidget.loadImageFromAssetName(news.channel.img),
                    ),
                    Text(
                      news.channel.name,
                      style: themeData.textTheme.bodySmall,
                    )
                  ],
                ),
                GestureDetector(
                  child: UtilWidget.loadImageFromAssetNameWithColor(
                      "assets/others.png", themeData.colorScheme.onPrimary
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  channelBox(ThemeData themeData, String label, String img, { Function? callback }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            callback!();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themeData.hoverColor,
                border: Border.all(color: themeData.colorScheme.onPrimary)
            ),
            child: UtilWidget.loadImageFromAssetName( img ),
          ),
        ),
        Text(
          label,
          style: themeData.textTheme.bodySmall,
        )
      ],
    );
  }
  
}
