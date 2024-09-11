import 'package:demo/domain/auth/pages/signin/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/color_const.dart';
import '../../../../widgets/util_widget.dart';
import '../../controller/signup_controller.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  final int otpLength = 4;
  final List<FocusNode> _focusNodes = [];
  final List<TextEditingController> _controllers = [];
  final signupController = Get.put(SignupController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signupController.startTimer();

    for (int i = 0; i < otpLength; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
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
                              Text("Enter OTP", style: themeData.textTheme.labelLarge),
                              Text("Create account and enjoy all services", style: themeData.textTheme.bodyMedium),
                              const SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(padding),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: width / 3,
                                      child: UtilWidget.loadImageFromAssetName("assets/otp.png"),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 30, bottom: 30),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: List.generate(otpLength, (index) {
                                          return _otpInput(context, index);
                                        })
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: themeData.textTheme.bodyMedium,
                                        children: [
                                          const TextSpan(
                                            text: "Resend code in : "
                                          ),
                                          TextSpan(
                                            text: signupController.countDown.value.toString(),
                                            style: TextStyle(
                                              color: themeData.colorScheme.error
                                            )
                                          )
                                        ]
                                      ),
                                    )
                                  ],
                                ),
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
                          "Continue",
                          () => continueButton()
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

  _otpInput(BuildContext context, int index) {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConst.g300,
      ),
      child: Center(
          child: TextField(
            textAlign: TextAlign.center,
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            maxLength: 1,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorConst.mainColor,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: ""
            ),
            onChanged: (value) => _handleOtpInput(value, index),
          )
      ),
    );
  }

  void _handleOtpInput(String value, int index) {
    if (index < otpLength - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (index == otpLength - 1) {
      _focusNodes[index].unfocus();
      continueButton();
    }
  }

  continueButton() {
    Get.to(() => const SignInPage());
  }

}
