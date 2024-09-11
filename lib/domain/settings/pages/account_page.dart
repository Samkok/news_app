import 'package:demo/utils/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';
import '../model/content_setting_model.dart';
import '../model/section_list_model.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  SectionListModel sectionList = SectionListModel(
      header: "Account Information",
      contentSettingModels: [
        ContentSettingModel(
            icon: Icon(Icons.phone_outlined, color: ColorConst.mainColor),
            title: "Phone Number",
            link: RouteName.phoneNumber
        ),
        ContentSettingModel(
            icon: Icon(Icons.email_outlined, color: ColorConst.mainColor),
            title: "Email",
            link: RouteName.changeEmail
        ),
        ContentSettingModel(
            icon: Icon(Icons.key_outlined, color: ColorConst.mainColor),
            title: "Password",
            link: RouteName.changePassword
        ),
        ContentSettingModel(
            icon: Icon(Icons.delete_outlined, color: ColorConst.mainColor),
            title: "Delete account",
            link: "/link"
        ),
      ]
  );

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
          "Setting",
          style: themeData.textTheme.bodyLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: _sectionWidget(themeData)
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sectionWidget(ThemeData themeData) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sectionList.header,
            style: themeData.textTheme.bodyMedium,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              ContentSettingModel setting = sectionList.contentSettingModels[index];
              return _settingItem(setting, themeData);
            },
            itemCount: sectionList.contentSettingModels.length,
          ),
        ],
      ),
    );
  }

  _settingItem(ContentSettingModel setting, ThemeData themeData) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(setting.link);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: themeData.hintColor.withOpacity(0),
              child: setting.icon,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  setting.title,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: themeData.textTheme.bodyMedium,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios_outlined, color: themeData.primaryColor)
          ],
        ),
      ),
    );
  }

}
