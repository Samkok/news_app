import 'package:demo/domain/auth/pages/reset_password/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_const.dart';
import '../../../../widgets/util_widget.dart';
import '../../controller/signup_controller.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  TextEditingController emailController = TextEditingController();
  FocusNode focusNode = FocusNode();
  SignupController authController = Get.put(SignupController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double padding = 30;
    double width = MediaQuery.of(context).size.width;

    ThemeData themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SignupController>(
            builder: (_) {
              return Container(
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
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Reset Password", style: themeData.textTheme.labelLarge),
                              Text("Create account and enjoy all services", style: themeData.textTheme.bodyMedium),
                              const SizedBox(height: 10),
                              UtilWidget.textFieldWithLabel(
                                context: context,
                                  focusNode: focusNode,
                                  label: "Email",
                                  hintText: "Enter your email",
                                  controller: emailController,
                                  width: width,
                                  onChanged: (value) => authController.checkEmailFormat(value),
                                  isPassword: authController.isPasswordShown.value
                              ),
                              const SizedBox(height: 10),
                              Visibility(
                                visible: !authController.isEmailCorrectFormat.value,
                                child: Text("Incorrect email format", style: TextStyle(
                                  color: ColorConst.error
                                )),
                              )
                            ],
                          ),

                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(padding),
                      child: UtilWidget.buttonFilled(
                        context, width, "Continue", continueBtn()
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }

  continueBtn() {
    return () {
      Get.to(() => const CheckEmailPage());
    };
  }

}
