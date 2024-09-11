import 'package:demo/domain/auth/controller/auth_controller.dart';
import 'package:demo/domain/auth/controller/signin_controller.dart';
import 'package:demo/domain/auth/pages/reset_password/reset_password.dart';
import 'package:demo/domain/auth/pages/signup/sign_up.dart';
import 'package:demo/utils/color_const.dart';
import 'package:demo/utils/route_name.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final signInController = Get.find<SignInController>();

  bool isPassword = true;
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeEmail = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double padding = 30;
    double width = MediaQuery.of(context).size.width;

    ThemeData themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SignInController>(
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
                            Text("Welcome back!", style: themeData.textTheme.bodyLarge),
                            const Text("Sign in to your account", style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                            )),
                            const SizedBox(height: 10),
                            UtilWidget.textFieldWithLabel(
                              context: context,
                                focusNode: focusNodeEmail,
                                label: "Email",
                                hintText: "Enter your email address",
                                controller: emailController,
                                width: width,
                                onChanged: (value) => (),
                            ),
                            const SizedBox(height: 10),
                            UtilWidget.textFieldWithLabelAndSuffix(
                              context: context,
                                focusNode: focusNodePassword,
                                label: "Password",
                                hintText: "Enter your password",
                                controller: passwordController,
                                width: width,
                                callback: () => signInController.togglePasswordShown(),
                                onChanged: (value) => {},
                                isPassword: signInController.isPasswordShown.value,
                                hasSuffix: true,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                    value: signInController.rememberMe.value,
                                    shape: const CircleBorder(),
                                    onChanged: (value) => signInController.toggleRememberMe(value),
                                  checkColor: themeData.primaryColor,
                                  fillColor: WidgetStateProperty.resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                      return themeData.hoverColor; // Default color
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Text("Remember Me", style: themeData.textTheme.bodySmall),
                                ),
                                Expanded(
                                  child: RichText(
                                    text: UtilWidget.linkText(
                                      "Forget Password",
                                      forgetPassword(),
                                      false,
                                      themeData.primaryColor
                                    ),
                                  ))
                              ],
                            ),
                            const SizedBox(height: 10),
                            UtilWidget.buttonFilled(
                                context,
                                width,
                                "SIGN IN",
                                signInCallback()
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Don't have an account? ", style: themeData.textTheme.bodyMedium),
                                RichText(text: UtilWidget.linkText(
                                    "Sign Up",
                                    signUp(),
                                    false,
                                    themeData.primaryColor
                                ))
                              ],
                            )
                          ],
                        ),

                      ),
                    ),
                  ),

                  // Social media
                  _socialMedia(width, padding, themeData)
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  Function forgetPassword() {
    return () {
      focusNodeEmail.unfocus();
      focusNodePassword.unfocus();
      Get.toNamed(RouteName.resetPassword);
    };
  }

  Function signUp() {
    return () {
      focusNodeEmail.unfocus();
      focusNodePassword.unfocus();
      Get.toNamed(RouteName.signUp);
    };
  }

  _socialMedia(double width, double padding, ThemeData themeData) {
    return Container(
      padding: EdgeInsets.all(padding),
      color: themeData.hintColor,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Or
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Text("Or", style: themeData.textTheme.bodySmall),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // Facebook
          UtilWidget.socialMediaButton(
            context: context,
              "assets/facebook.png",
              "Facebook",
                  () => print("Facebook")
          ),
          const SizedBox(height: 10),
          // Google
          UtilWidget.socialMediaButton(
            context: context,
              "assets/google.png",
              "Google",
                  () => print("Google")
          ),
        ],
      ),
    );
  }

  Function signInCallback() {
    return () {
      focusNodeEmail.unfocus();
      focusNodePassword.unfocus();

      final authController = Get.find<AuthController>();
      authController.login();
    };
  }

}
