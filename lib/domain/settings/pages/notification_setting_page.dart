import 'package:demo/domain/settings/model/notification_setting_list_model.dart';
import 'package:demo/domain/settings/model/notification_setting_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';

class NotificationSettingPage extends StatefulWidget {
  const NotificationSettingPage({super.key});

  @override
  State<NotificationSettingPage> createState() => _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {

  List<NotificationSettingListModel> notificationList = [
    NotificationSettingListModel(
        title: "Special Tips and Offers",
        notifications: [
          NotificationSettingModel(name: "Push notification", callback: () => (), value: true),
          NotificationSettingModel(name: "Email", callback: () => (), value: true),
        ]
    ),
    NotificationSettingListModel(
        title: "Activity",
        notifications: [
          NotificationSettingModel(name: "Push notification", callback: () => (), value: false),
          NotificationSettingModel(name: "Email", callback: () => (), value: true),
        ]
    ),
    NotificationSettingListModel(
        title: "Reminders",
        notifications: [
          NotificationSettingModel(name: "Push notification", callback: () => (), value: false),
          NotificationSettingModel(name: "Email", callback: () => (), value: true),
        ]
    ),
  ];
  
  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.hintColor,
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
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Expanded(
          child: ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (ctx, index) {
              return _sectionWidget(themeData, index);
            },
          )
        ),
      ),
    );
  }

  _sectionWidget(ThemeData themeData, int i) {
    if (i >= notificationList.length) {
      return const SizedBox(); // Return an empty widget if index is out of bounds
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            notificationList[i].title,
            style: themeData.textTheme.bodyMedium,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              NotificationSettingModel notification = notificationList[i].notifications[index];
              return _notificationItem(themeData, notification);
            },
            itemCount: notificationList[i].notifications.length,
          ),
          // (i == sectionList.length-1) ? const SizedBox() : Divider(height: 10, thickness: 1, color: ColorConst.g300)
        ],
      ),
    );
  }

  _notificationItem(ThemeData themeData, NotificationSettingModel notification) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              notification.name,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: themeData.textTheme.bodySmall,
            ),
          ),
          Switch(
            value: notification.value,
            onChanged: (value) => notification.callback,
            activeColor: ColorConst.mainColor,
            activeTrackColor: ColorConst.g300,
            inactiveTrackColor: ColorConst.g300,
            inactiveThumbColor: ColorConst.g50,
          )
        ],
      ),
    );
  }

}
