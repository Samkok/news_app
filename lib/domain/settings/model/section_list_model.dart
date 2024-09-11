import 'package:demo/domain/settings/model/content_setting_model.dart';

class SectionListModel {

  String header;
  List<ContentSettingModel> contentSettingModels;

  SectionListModel({required this.header, required this.contentSettingModels});
}