import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/route_name.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
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
        title: Text(
          "Channel",
          style: themeData.textTheme.bodyLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                  style: themeData.textTheme.bodySmall,
                  children: [
                    TextSpan(
                        text: "Follow for more channels\n",
                        style: themeData.textTheme.bodyLarge
                    ),
                    const TextSpan(
                      text: "Follow some official channels that you may know and like to get updates on their stories.",
                    ),
                  ]
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  itemCount: 8,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _channel(themeData, "Follow");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _channel(ThemeData themeData, String label) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteName.detailArticle),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: themeData.hoverColor
                ),
                child: UtilWidget.loadImageFromAssetName("assets/bbc.png"),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BBC News",
                        style: themeData.textTheme.bodyMedium,
                      ),
                      Text(
                        "80,000 followers",
                        style: themeData.textTheme.bodySmall,
                      )

                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showUnfollowDialog(themeData);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: themeData.primaryColor,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: (MediaQuery.of(context).size.width - 40) / 3,
                      child: Text(
                        textAlign: TextAlign.center,
                        label,
                        style: themeData.textTheme.bodyMedium,
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showUnfollowDialog(ThemeData themeData) {
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
                                    child: UtilWidget.loadImageFromAssetName("assets/unfollow.png"),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Are your sure want to unfollow ",
                                            style: themeData.textTheme.bodySmall,
                                          ),
                                          TextSpan(
                                            text: "\"BBC News\" ?",
                                            style: themeData.textTheme.bodyMedium
                                          )
                                        ]
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: UtilWidget.flexibleButtonWithBorder(
                                            context, "Cancel", () => Navigator.pop(context)),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: UtilWidget.flexibleButtonFilled(
                                            context, "Unfollow", () => ()),
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

}
