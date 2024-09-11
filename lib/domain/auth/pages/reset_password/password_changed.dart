import 'package:flutter/material.dart';

import '../../../../utils/color_const.dart';
import '../../../../widgets/util_widget.dart';

class PasswordChangedPage extends StatefulWidget {
  const PasswordChangedPage({super.key});

  @override
  State<PasswordChangedPage> createState() => _PasswordChangedPageState();
}

class _PasswordChangedPageState extends State<PasswordChangedPage> {
  @override
  Widget build(BuildContext context) {
    double padding = 30;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorConst.backgroundBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Body
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: padding, left: padding, right: padding),
                  width: width,
                  color: ColorConst.background,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: width / 3,
                          child: UtilWidget.loadImageFromAssetName("assets/password_changed.png"),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30, bottom: 30),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Check Email", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: ColorConst.g900
                                )),
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
              ),

              Container(
                padding: EdgeInsets.only(left: padding, right: padding, bottom: padding),
                child: UtilWidget.buttonFilled(
                  context, width, "Login Now", () => ()
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: padding, right: padding, bottom: padding),
                child: UtilWidget.buttonWithBorder(
                  context: context,
                    width,
                    "Skip",
                        () => ()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
