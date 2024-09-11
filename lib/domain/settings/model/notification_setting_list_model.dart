import 'package:demo/domain/settings/model/notification_setting_model.dart';

class NotificationSettingListModel {
  String title;
  List<NotificationSettingModel> notifications;

  NotificationSettingListModel({required this.title, required this.notifications});
}