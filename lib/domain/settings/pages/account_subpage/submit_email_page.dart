import 'package:demo/utils/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_const.dart';
import '../../../../widgets/util_widget.dart';

class SubmitEmailPage extends StatefulWidget {
  const SubmitEmailPage({super.key});

  @override
  State<SubmitEmailPage> createState() => _SubmitEmailPageState();
}

class _SubmitEmailPageState extends State<SubmitEmailPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  PersistentBottomSheetController? bottomSheetController;

  String? email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.arguments != null) {
      email = Get.arguments as String;
      emailController.text = email!;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.unfocus();
    emailFocusNode.dispose();

    passwordFocusNode.unfocus();
    passwordFocusNode.dispose();

    if (bottomSheetController != null) {
      bottomSheetController!.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
          "Change Email",
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
                  child: Column(
                    children: [
                      UtilWidget.textFieldWithLabel(
                        context: context,
                          label: "Email",
                          hintText: "Your email",
                          controller: emailController,
                          width: width,
                          focusNode: emailFocusNode,
                          onChanged: (value) => ()
                      ),
                      const SizedBox(height: 10),
                      UtilWidget.textFieldWithLabelAndSuffix(
                        context: context,
                          label: "Password",
                          isPassword: true,
                          hintText: "password",
                          controller: passwordController,
                          width: width,
                          focusNode: passwordFocusNode,
                          onChanged: (value) => (),
                          callback: () => ()
                      )
                    ],
                  )
              ),
            ),
            UtilWidget.buttonFilled(context, width, "Submit", () => showBottomSheet(context))
          ],
        ),
      )
    );
  }

  showBottomSheet(BuildContext context, ) {
    ThemeData themeData = Theme.of(context);
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
        ),
        builder: (BuildContext context) {
          return Wrap(
            children: [
              Container(
                // height: 400,
                color: Colors.transparent,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 80,
                          color: Colors.transparent,
                        ),
                        Wrap(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 80),
                              decoration: BoxDecoration(
                                  color: themeData.hintColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Email Verification Sent\n",
                                    style: themeData.textTheme.bodyLarge,
                                  ),
                                  Text(
                                    "Please check your inbox for the verification email. If you don't see it, remember to check your spam folder.\n",
                                    textAlign: TextAlign.center,
                                    style: themeData.textTheme.bodyMedium,
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                  UtilWidget.buttonFilled(
                                      context,
                                      MediaQuery.of(context).size.width,
                                      "Back To Home",
                                      () => Get.offAllNamed(RouteName.boarding)
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      top: 0,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: ColorConst.mainColor.withOpacity(0),
                        child: UtilWidget.loadImageFromAssetName("assets/tick.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
  
}
