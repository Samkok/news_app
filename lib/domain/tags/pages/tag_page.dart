import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagPage extends StatefulWidget {
  const TagPage({super.key});

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> with TickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.hintColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: themeData.colorScheme.onPrimary),
        ),
        centerTitle: false,
        title: Text(
          "#lifestile",
          style: themeData.textTheme.bodyLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  controller: tabController,
                  unselectedLabelColor: themeData.hoverColor,
                  labelColor: themeData.primaryColor,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: themeData.primaryColor, width: 3),
                      insets: const EdgeInsets.symmetric(
                          horizontal: 90
                      )
                  ),
                  tabs: const [
                    Tab(text: "Top"),
                    Tab(text: "Latest"),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,

                          itemBuilder: (context, index) {
                            return tagItem(themeData);
                          },
                        ),
                        Container(
                          color: Colors.green,
                        )
                      ],
                    )
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

  tagItem(ThemeData themeData) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: themeData.hoverColor,
            radius: 30,
            child: UtilWidget.loadImageFromAssetName("assets/bbc.png"),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BBC News",
                        style: themeData.textTheme.bodyMedium,
                      ),
                      Text(
                        "16min",
                        style: themeData.textTheme.bodySmall,
                      )
                    ],
                  ),
                  Text(
                      "...a new wave of tech innovations is reshaping urban #lifestyle. From smart",
                      style: themeData.textTheme.bodySmall,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          SizedBox(
                            width: 125,
                            height: 65,
                            child: UtilWidget.loadImageFromAssetName("assets/tag_img1.png"),
                          ),
                          SizedBox(
                            width: 125,
                            height: 65,
                            child: UtilWidget.loadImageFromAssetName("assets/tag_img2.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            size: 15,
                            color: themeData.colorScheme.onPrimary,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              "2K Likes",
                              style: themeData.textTheme.bodySmall,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.comment_outlined,
                            size: 15,
                            color: themeData.colorScheme.onPrimary,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              "0 replies",
                              style: themeData.textTheme.bodySmall,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
