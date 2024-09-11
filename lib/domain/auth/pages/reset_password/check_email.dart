import 'package:demo/utils/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_const.dart';
import '../../../../widgets/util_widget.dart';

class CheckEmailPage extends StatefulWidget {
  const CheckEmailPage({super.key});

  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  @override
  Widget build(BuildContext context) {
    double padding = 30;
    double width = MediaQuery.of(context).size.width;

    ThemeData themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: themeData.hintColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Body
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: padding, left: padding, right: padding),
                  width: width,
                  color: themeData.hintColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: width / 3,
                        child: UtilWidget.loadImageFromAssetName("assets/check_email.png"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Check Email", style: themeData.textTheme.labelLarge),
                            Text("To reset your password, please refer to the email we just sent you.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: ColorConst.g400
                              )),
                          ]
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: padding, right: padding, bottom: padding),
                child: UtilWidget.buttonFilled(
                  context, width, "Login Now", () => Get.toNamed(RouteName.signIn)
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: padding, right: padding, bottom: padding),
                child: UtilWidget.buttonWithBorder(
                  context: context,
                    width,
                    "Skip", () => Get.back()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
