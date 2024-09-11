import 'package:demo/domain/auth/controller/auth_controller.dart';
import 'package:demo/domain/settings/model/content_setting_model.dart';
import 'package:demo/domain/settings/model/section_list_model.dart';
import 'package:demo/utils/color_const.dart';
import 'package:demo/utils/route_name.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  List<SectionListModel> sectionList = [
    SectionListModel(
        header: "Account Information",
        contentSettingModels: [
          ContentSettingModel(
              icon: Icon(Icons.person_outline, color: ColorConst.mainColor),
              title: "Account",
              link: RouteName.account
          ),
          ContentSettingModel(
              icon: Icon(Icons.lock_outline, color: ColorConst.mainColor),
              title: "Privacy",
              link: RouteName.privacy
          ),
        ]
    ),
    SectionListModel(
        header: "General",
        contentSettingModels: [
          ContentSettingModel(
              icon: Icon(Icons.notifications_none_outlined, color: ColorConst.mainColor),
              title: "Notification",
              link: RouteName.notification
          ),
          ContentSettingModel(
              icon: Icon(Icons.wallet_outlined, color: ColorConst.mainColor),
              title: "Language",
              link: RouteName.language
          ),
          ContentSettingModel(
              icon: Icon(Icons.dark_mode_outlined, color: ColorConst.mainColor),
              title: "Mode",
              link: RouteName.darkMode
          ),
        ]
    ),
    SectionListModel(
        header: "About",
        contentSettingModels: [
          ContentSettingModel(
              icon: Icon(Icons.privacy_tip_outlined, color: ColorConst.mainColor),
              title: "Legal and Policies",
              link: RouteName.legalAndPolicy
          ),
          ContentSettingModel(
              icon: Icon(Icons.help_outline, color: ColorConst.mainColor),
              title: "Help & Support",
              link: RouteName.aboutUs
          ),
          ContentSettingModel(
              icon: Icon(Icons.info_outline, color: ColorConst.mainColor),
              title: "About Us",
              link: RouteName.aboutUs
          ),
        ]
    ),
  ];

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    double width = MediaQuery.of(context).size.width;

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
                child: ListView.builder(
                  itemCount: sectionList.length,
                  itemBuilder: (context, i) {
                    return _sectionWidget(themeData, i);
                  },
                ),
              ),
            ),
            UtilWidget.buttonWithBorder(
              context: context,
              width,
              "Log Out",
              () => showLogoutDialog(themeData),
              borderColor: themeData.colorScheme.error,
              textColor: themeData.colorScheme.error
            )
          ],
        ),
      ),
    );
  }

  showLogoutDialog(ThemeData themeData) {
    showDialog(
        context: context,
        builder: (dialogCtx) {
          return Dialog(
            child: LayoutBuilder(
              builder: (_, constrain) {
                return Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                      // height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: themeData.hintColor
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Icon(Icons.close, color: themeData.colorScheme.onPrimary),
                            onTap: () {
                              Navigator.pop(dialogCtx);
                            },
                          ),
                          SizedBox(
                            width: constrain.maxWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: themeData.hintColor.withOpacity(0),
                                  child: UtilWidget.loadImageFromAssetName("assets/logout.png"),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                                  child: Text(
                                    "Are your sure want to logout?",
                                    style: themeData.textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: UtilWidget.flexibleButtonWithBorder(
                                        dialogCtx,
                                        // (constrain.minWidth - 30) / 2 - 5,
                                        "Log Out",
                                        () => authController.logout(),
                                        borderColor: themeData.colorScheme.error,
                                        textColor: themeData.colorScheme.error
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      child: UtilWidget.flexibleButtonFilled(
                                        dialogCtx,
                                        // (constrain.minWidth - 30) / 2 - 5,
                                        "Cancel",
                                            () => Navigator.pop(dialogCtx),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                );
              }
            ),
          );
        }
    );
  }

  _sectionWidget(ThemeData themeData, int i) {
    if (i >= sectionList.length) {
      return const SizedBox(); // Return an empty widget if index is out of bounds
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sectionList[i].header,
            style: themeData.textTheme.bodyMedium,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              ContentSettingModel setting = sectionList[i].contentSettingModels[index];
              return _settingItem(setting, themeData);
            },
            itemCount: sectionList[i].contentSettingModels.length,
          ),
          (i == sectionList.length-1) ? const SizedBox() : Divider(height: 10, thickness: 1, color: ColorConst.g300)
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
              backgroundColor: themeData.colorScheme.onPrimary.withOpacity(0.2),
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
            Icon(Icons.arrow_forward_ios_outlined, color: themeData.colorScheme.onPrimary)
          ],
        ),
      ),
    );
  }
}
