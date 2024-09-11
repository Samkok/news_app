import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChannelDetailPage extends StatefulWidget {
  const ChannelDetailPage({super.key});

  @override
  State<ChannelDetailPage> createState() => _ChannelDetailPageState();
}

class _ChannelDetailPageState extends State<ChannelDetailPage> with TickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Wrap(
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.end,
              direction: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.log("show");
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: true,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Container(
                          color: themeData.hintColor,
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Notification",
                                    style: themeData.textTheme.bodyMedium,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Post",
                                          style: themeData.textTheme.bodySmall,
                                        ),
                                        Switch(value: true, onChanged: (value) => ())
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Live",
                                        style: themeData.textTheme.bodySmall,
                                      ),
                                      Switch(value: false, onChanged: (value) => ())
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.notifications_active_outlined,
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    UtilWidget.showShareDialog(themeData, context);
                  },
                  child: Icon(
                    Icons.share_outlined,
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const ClipOval(
                  child: Image(
                    image: AssetImage("assets/cnn.png"),
                    width: 70,
                    height: 70,
                  ),
                ),
                Column(
                  // direction: Axis.vertical,
                  // spacing: 0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CNN Indonesia",
                      style: themeData.textTheme.bodyLarge,
                    ),
                    Text(
                      "@cnnindonesia",
                      style: themeData.textTheme.bodySmall,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: themeData.primaryColor),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      width: MediaQuery.of(context).size.width / 4,
                      child: Center(
                        child: Text(
                          "Following",
                          style: themeData.textTheme.bodySmall,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),

            // Bio
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "CNN Indonesia is committed to providing accurate, balanced, and in-depth coverage to their readers and viewers.",
                style: themeData.textTheme.bodyMedium,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),

            // Links
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: themeData.hoverColor,
                          child: UtilWidget.loadImageFromAssetName("assets/link.png"),
                        ),
                        Text(
                          "cnn.com",
                          style: themeData.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        backgroundColor: themeData.hoverColor,
                        child: UtilWidget.loadImageFromAssetName("assets/facebook.png"),
                      ),
                      CircleAvatar(
                        backgroundColor: themeData.hoverColor,
                        child: UtilWidget.loadImageFromAssetName("assets/instagram.png"),
                      ),
                      CircleAvatar(
                        backgroundColor: themeData.hoverColor,
                        child: UtilWidget.loadImageFromAssetName("assets/linkedin.png"),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Numeric detail
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: themeData.hoverColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "100",
                        style: themeData.textTheme.bodyMedium,
                      ),
                      Text(
                        "News",
                        style: themeData.textTheme.bodySmall,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "20.5K",
                        style: themeData.textTheme.bodyMedium,
                      ),
                      Text(
                        "Followers",
                        style: themeData.textTheme.bodySmall,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "250",
                        style: themeData.textTheme.bodyMedium,
                      ),
                      Text(
                        "Followings",
                        style: themeData.textTheme.bodySmall,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "30.2K",
                        style: themeData.textTheme.bodyMedium,
                      ),
                      Text(
                        "Upvotes",
                        style: themeData.textTheme.bodySmall,
                      )
                    ],
                  ),
                ],
              ),
            ),

            // Body
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      unselectedLabelColor: themeData.hoverColor,
                      labelColor: themeData.primaryColor,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: themeData.primaryColor, width: 3),
                        insets: const EdgeInsets.symmetric(
                            horizontal: 70
                        )
                      ),
                      tabs: const [
                        Tab(
                          text: "News",
                        ),
                        Tab(
                          text: "Videos",
                        ),
                        Tab(
                          text: "Live TV",
                        ),
                      ],
                    ),
                    Flexible(
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: tabController,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return newsItem(themeData);
                              },
                            ),
                            Container(
                              color: Colors.green,
                            ),
                            Container(
                              color: Colors.blue,
                            )
                          ]
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  newsItem(ThemeData themeData) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sir Keir Starmer cleared by",
                    style: themeData.textTheme.bodyMedium,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Labour leader Sir Keir Starmer and deputy Angela Rayner have been cleared by Durham Police of breaking lockdown rules",
                    style: themeData.textTheme.bodySmall,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "January 27, 2024",
                          style: themeData.textTheme.bodySmall,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(Icons.do_not_disturb_on_total_silence, size: 5, color: themeData.colorScheme.onPrimary,),
                        ),
                        Text(
                          "Politics",
                          style: themeData.textTheme.bodySmall,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          UtilWidget.loadImageFromAssetName("assets/hotnews1.png")
        ],
      ),
    );
  }

  showSetDisplayBottomSheet(BuildContext context, ThemeData themeData)
  {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.3,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: themeData.hintColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                controller: scrollController,
                children: [

                ],
              ),
            );
          },
        );
      },
    );
  }
}

