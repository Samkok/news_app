import 'package:demo/domain/auth/controller/signup_controller.dart';
import 'package:demo/domain/auth/pages/signup/sign_up_password.dart';
import 'package:demo/utils/color_const.dart';
import 'package:demo/utils/route_name.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode focusNodeFn = FocusNode();
  FocusNode focusNodeLn = FocusNode();
  FocusNode focusNodeEmail = FocusNode();

  final signupController = Get.find<SignupController>();

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();

    focusNodeFn.dispose();
    focusNodeLn.dispose();
    focusNodeEmail.dispose();
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
                            Text("Create account and enjoy all service", style: themeData.textTheme.bodyMedium),
                            const SizedBox(height: 10),
                            UtilWidget.textFieldWithLabel(
                              context: context,
                                focusNode: focusNodeFn,
                                label: "First Name",
                                hintText: "Enter your First Name",
                                controller: firstNameController,
                                width: width,
                                onChanged: (value) => ()
                            ),
                            const SizedBox(height: 10),
                            UtilWidget.textFieldWithLabel(
                              context: context,
                                focusNode: focusNodeLn,
                                label: "Last Name",
                                hintText: "Enter your Last Name",
                                controller: lastNameController,
                                width: width,
                                onChanged: (value) => ()
                            ),
                            const SizedBox(height: 10),
                            UtilWidget.textFieldWithLabel(
                              context: context,
                                focusNode: focusNodeEmail,
                                label: "Email",
                                hintText: "Enter your email",
                                controller: emailController,
                                width: width,
                              onChanged: (value) => ()
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                    value: signupController.agreed.value,
                                    onChanged: (value) {
                                      signupController.setAgreed(value!);
                                    },
                                  checkColor: themeData.primaryColor,
                                  fillColor: WidgetStateProperty.resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                      return themeData.hoverColor; // Default color
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: themeData.textTheme.bodyMedium,
                                      children: [
                                        const TextSpan(
                                            text: "I agree to the company ",
                                        ),
                                        UtilWidget.linkText(
                                            "Term of Service",
                                                () => (),
                                            false,
                                            themeData.primaryColor
                                        ),
                                        const TextSpan(
                                          text: " and ",
                                        ),
                                        UtilWidget.linkText(
                                            "Privacy",
                                                () => (),
                                            false,
                                            themeData.primaryColor
                                        )
                                      ]
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            UtilWidget.buttonFilled(
                                context,
                                width,
                                "SIGN UP",
                                () => _signUp(context)
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Already have an account? ", style: themeData.textTheme.bodySmall),
                                RichText(text: UtilWidget.linkText(
                                    "Sign In",
                                    () => Get.toNamed(RouteName.signIn),
                                    false,
                                    ColorConst.mainColor
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

  _signUp(BuildContext context) {
    signupController.setSignUpInfo(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
    );
    focusNodeFn.unfocus();
    focusNodeLn.unfocus();
    focusNodeEmail.unfocus();

    Get.to(() => const SignUpPasswordPage());
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
              "Facebook", () => ()
          ),
          const SizedBox(height: 10),
          // Google
          UtilWidget.socialMediaButton(
              context: context,
              "assets/google.png",
              "Google", () => ()
          ),
        ],
      ),
    );
  }
}
