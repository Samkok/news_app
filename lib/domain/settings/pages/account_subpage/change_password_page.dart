import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_const.dart';
import '../../../../widgets/util_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  FocusNode newPasswordFocusNode = FocusNode();

  PersistentBottomSheetController? bottomSheetController;

  String? email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
    newPasswordController.dispose();

    passwordFocusNode.unfocus();
    passwordFocusNode.dispose();

    newPasswordFocusNode.unfocus();
    newPasswordFocusNode.dispose();



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
            "Change Password",
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
                            label: "Current password",
                            hintText: "Your password",
                            controller: passwordController,
                            width: width,
                            focusNode: passwordFocusNode,
                            onChanged: (value) => ()
                        ),
                        const SizedBox(height: 10),
                        UtilWidget.textFieldWithLabelAndSuffix(
                          context: context,
                            label: "New Password",
                            isPassword: true,
                            hintText: "New Password",
                            controller: newPasswordController,
                            width: width,
                            focusNode: newPasswordFocusNode,
                            onChanged: (value) => (),
                            callback: () => ()
                        )
                      ],
                    )
                ),
              ),
              UtilWidget.buttonFilled(context ,width, "Change Password", () {
              }),
              const SizedBox(height: 15),
              UtilWidget.buttonWithBorder(context: context, width, "Save", () {

              })
            ],
          ),
        )
    );
  }
}
