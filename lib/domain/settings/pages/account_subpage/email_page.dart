import 'package:demo/domain/auth/controller/auth_controller.dart';
import 'package:demo/utils/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_const.dart';
import '../../../../widgets/util_widget.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {

  final authController = Get.find<AuthController>();

  TextEditingController emailController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    focusNode.unfocus();
    focusNode.dispose();
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
      body: GetBuilder<AuthController>(
          builder: (_) {
            return Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: UtilWidget.textFieldWithLabel(
                          context: context,
                            label: "Email",
                            hintText: authController.loggedInUser.value!.email,
                            controller: emailController,
                            width: width, focusNode: focusNode,
                            onChanged: (value) => ()
                        )
                    ),
                  ),
                  UtilWidget.buttonFilled(context, width, "Change Email", () => Get.toNamed(RouteName.submitEmail, arguments: emailController.text))
                ],
              ),
            );
          }
      ),
    );
  }
}
