import 'dart:async';

import 'package:demo/domain/auth/controller/signup_controller.dart';
import 'package:demo/domain/auth/pages/signup/otp.dart';
import 'package:demo/utils/color_const.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPasswordPage extends StatefulWidget {
  const SignUpPasswordPage({super.key});

  @override
  State<SignUpPasswordPage> createState() => _SignUpPasswordPageState();
}

class _SignUpPasswordPageState extends State<SignUpPasswordPage> {
  TextEditingController pwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();
  final FocusNode _focusNodePwd = FocusNode();
  final FocusNode _focusNodeConfirmPwd = FocusNode();

  final signupController = Get.put(SignupController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Future.delayed(const Duration(seconds: 1), () => signupController.resetPasswordPart());
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
                            Text("Sign Up", style: themeData.textTheme.labelLarge),
                            Text("Create account and enjoy all services", style: themeData.textTheme.bodyLarge),
                            const SizedBox(height: 10),
                            _passwordWidget(
                              width: width,
                              label: "Password",
                              hint: "Enter your password",
                              txtController: pwdController,
                              focusNode: _focusNodePwd,
                              themeData: themeData
                            ),
                            const SizedBox(height: 10),
                            _confirmPasswordWidget(
                                width: width,
                                focusNode: _focusNodeConfirmPwd,
                                label: "Confirm your password",
                                hint: "Enter your password again",
                                txtController: confirmPwdController,
                            )
                          ],
                        ),

                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(padding),
                    child: UtilWidget.buttonFilled(
                        context,
                        width,
                        "SIGN UP",
                        signUp(context)
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

  Function signUp(BuildContext context) {
    return () {
      _focusNodePwd.unfocus();
      _focusNodeConfirmPwd.unfocus();
      if (signupController.isPwdMatched.value && (pwdController.text.trim().isNotEmpty)) {
        Get.to(() => const OtpPage());
      } else {

      }
    };
  }

  checkInputPassword(String password, String confirmPassword) {
    signupController.checkInputPwd(password);
    signupController.checkPasswordMatched(password: password, confirmPassword: confirmPassword);
  }

  _passwordWidget({
    required double width,
    required String label,
    required String hint,
    required TextEditingController txtController,
    required FocusNode focusNode,
    required ThemeData themeData
  }) {
    return Column(
      children: [
        UtilWidget.textFieldWithLabelAndSuffix(
          context: context,
            focusNode: focusNode,
            label: label,
            hintText: hint,
            controller: txtController,
            width: width,
            callback: () => signupController.togglePasswordShown(),
            onChanged: (value) => checkInputPassword(value, confirmPwdController.text),
            isPassword: signupController.isPasswordShown.value
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: signupController.isPwdHasEnoughLength.value ?
                  Icon(Icons.done, color: ColorConst.success) :
                  Icon(Icons.close, color: ColorConst.error),
                ),
                Text("Minimum 8 characters", style: themeData.textTheme.bodySmall)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: signupController.isPwdHasNumber.value ?
                  Icon(Icons.done, color: ColorConst.success) :
                  Icon(Icons.close, color: themeData.colorScheme.error),
                ),
                Text("At lease 1 number (1-9)", 
                  style: themeData.textTheme.bodySmall
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: signupController.isPwdHasUpperCase.value ?
                  Icon(Icons.done, color: ColorConst.success) :
                  Icon(Icons.close, color: themeData.colorScheme.error),
                ),
                Text("At least one upper case", style: themeData.textTheme.bodySmall)
              ],
            )
          ],
        )
      ],
    );
  }

  _confirmPasswordWidget({
    required double width,
    required String label,
    required String hint,
    required TextEditingController txtController,
    required FocusNode focusNode
  }) {
    return Column(
      children: [
        UtilWidget.textFieldWithLabelAndSuffix(
          context: context,
            focusNode: focusNode,
            label: label,
            hintText: hint,
            controller: txtController,
            width: width,
            callback: () => signupController.togglePasswordShown(),
            onChanged: (value) => signupController.checkPasswordMatched(
              password: pwdController.text,
              confirmPassword: value
            ),
            isPassword: signupController.isPasswordShown.value
        ),
        const SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: signupController.isPwdMatched.value ?
                  Icon(Icons.done, color: ColorConst.success) :
                  Icon(Icons.close, color: ColorConst.error),
                ),
                signupController.isPwdMatched.value ?
                Text("Password matched", style: TextStyle(
                    color: ColorConst.g400
                )) : Text("Password not match", style: TextStyle(
                    color: ColorConst.error
                ))
              ],
            ),
          ],
        )
      ],
    );
  }

}
