import 'package:demo/domain/channel/model/channel_model.dart';

class ArticleModel {
  int id;
  String category;
  String title;
  String article;
  String publishedDate;
  int timeToRead;
  String img;
  ChannelModel channel;

  ArticleModel({
    required this.id,
    required this.category,
    required this.title,
    required this.article,
    required this.publishedDate,
    required this.timeToRead,
    required this.img,
    required this.channel,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        id: json["id"],
        category: json["category"],
        title: json["title"],
        article: json["article"],
        publishedDate: json['publishedDate'],
        timeToRead: json['timeToRead'],
        img: json['img'],
      channel: json['channel']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'category' : category,
      'title' : title,
      'article' : article,
      'publishedDate' : publishedDate,
      'timeToRead' : timeToRead,
      'img' : img,
      'channel': channel
    };
  }

}