import 'package:demo/domain/channel/model/channel_model.dart';
import 'package:demo/domain/notification/models/notification_category.dart';

class NotificationModel {
  NotificationCategoryModel category;
  ChannelModel channel;
  String title;
  String alertDate;

  NotificationModel({required this.category, required this.channel, required this.title, required this.alertDate});
}