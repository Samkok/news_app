import 'package:demo/domain/channel/model/channel_model.dart';
import 'package:demo/domain/notification/models/notification_category.dart';
import 'package:demo/domain/notification/models/notification_model.dart';
import 'package:demo/utils/route_name.dart';
import 'package:demo/utils/utils.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<String> filters = [
    "All", "Breaking News", "Alerts", "Special Report", "Tech Update", "Healthy Alert"
  ];

  List<NotificationModel> notifications = [
    NotificationModel(
        category: NotificationCategoryModel(name: "Breaking News", icon: "assets/breaking_news.png"),
        channel: ChannelModel(name: "BBC News", img: "assets/bbc.png"),
        title: "New Study Reveals Alarming Trends in Climate Change. Tap to Read More.",
        alertDate: "20240905"
    ),
    NotificationModel(
        category: NotificationCategoryModel(name: "Special Report", icon: "assets/alert.png"),
        channel: ChannelModel(name: "ITV", img: "assets/itv.png"),
        title: "Investigative Journalists Uncover Corruption Scandal Involving High-Ranking Officials. Dive Deeper.",
        alertDate: "20240905"
    ),
    NotificationModel(
        category: NotificationCategoryModel(name: "Tech Update", icon: "assets/tech.png"),
        channel: ChannelModel(name: "Forbes", img: "assets/forbes.png"),
        title: "Apple Launches Highly Anticipated Product Line. Get the Latest Updates.",
        alertDate: "20240905"
    ),
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
          "Notification",
          style: themeData.textTheme.bodyLarge,
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(RouteName.notificationSetting),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Icon(Icons.settings_outlined, color: themeData.colorScheme.onPrimary),
            ),
          )
        ],
      ),
      backgroundColor: themeData.hintColor,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filter
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(filters.length, (index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10  ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.transparent,
                          border: Border.all(color: themeData.hoverColor)
                      ),
                      child: Center(
                        child: Text(
                          filters[index],
                          style: themeData.textTheme.bodySmall,
                        ),
                      ),
                    );
                  },),
                ),
              ),
            ),

            // Notification
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "Today",
                      //   style: themeData.textTheme.bodyMedium,
                      // ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        margin: const EdgeInsets.only(top: 10),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: notifications.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              bool after = Utils.checkIfBeforeNow("20240906");
                              return Text(
                                after ? "Yesterday" : "Today",
                                style: themeData.textTheme.bodyMedium,
                              );
                            }
                            NotificationModel notification = notifications[index - 1];
                            return notificationItem(themeData, notification);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  notificationGroup(ThemeData themeData) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notifications.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            bool after = Utils.checkIfBeforeNow("20240906");
            return Text(
              after ? "Yesterday" : "Today",
              style: themeData.textTheme.bodyMedium,
            );
          }
          NotificationModel notification = notifications[index - 1];
          return notificationItem(themeData, notification);
        },
      ),
    );
  }
  
  notificationItem(ThemeData themeData, NotificationModel notification) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themeData.hoverColor
            ),
            padding: const EdgeInsets.all(7),
            child: UtilWidget.loadImageFromAssetNameWithColor(notification.category.icon, themeData.primaryColor),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification.category.name,
                              style: themeData.textTheme.bodyMedium,
                            ),
                            Text(
                              notification.channel.name,
                              style: themeData.textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Just now",
                        style: themeData.textTheme.bodySmall,
                      )
                    ],
                  ),
                  // Main title
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                      notification.title,
                      style: themeData.textTheme.bodyMedium,
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
  
}
