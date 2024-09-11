import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/color_const.dart';

class UtilWidget {
  static TextSpan linkText(
      String label,
      Function callback,
      bool isUnderline,
      Color color) {
    return TextSpan(

        text: label,
        recognizer: TapGestureRecognizer()
          ..onTap = () => callback(),
        style: TextStyle(
            color: color,
            decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
        ),
    );
  }

  static Widget buttonWithBorder(
      double width,
      String label,
      Function callback,
      {
        Color? borderColor,
        Color? textColor,
        required BuildContext context
      }
    ) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: borderColor ?? ColorConst.mainColor)
        ),
        child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            width: width,
            child: Text(
              textAlign: TextAlign.center,
              label,
              style: TextStyle(
                  fontSize: 15,
                  color: textColor ?? themeData.colorScheme.primary
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            )
        ),
      ),
    );
  }

  static Widget flexibleButtonWithBorder(
      BuildContext context,
      String label,
      Function callback,
      {
        Color? borderColor,
        Color? textColor,
      }
      ) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: borderColor ?? themeData.primaryColor)
        ),
        child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              textAlign: TextAlign.center,
              label,
              style: TextStyle(
                  fontSize: 15,
                  color: textColor ?? themeData.colorScheme.primary
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            )
        ),
      ),
    );
  }

  static Widget buttonFilled(
      BuildContext context,
      double width,
      String label,
      Function callback
      ) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        decoration: BoxDecoration(
            color: themeData.primaryColor,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            width: width,
            child: Text(
              textAlign: TextAlign.center,
              label,
              style: themeData.textTheme.bodyMedium,
            )
        ),
      ),
    );
  }

  static Widget flexibleButtonFilled(
      BuildContext context,
      String label,
      Function callback
      ) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        decoration: BoxDecoration(
            color: themeData.primaryColor,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              textAlign: TextAlign.center,
              label,
              style: themeData.textTheme.bodyMedium,
            )
        ),
      ),
    );
  }

  static Widget socialMediaButton(
      String iconName,
      String label,
      Function callback, {required BuildContext context}
      ) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constrain)  {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: UtilWidget.loadImageFromAssetName(
                    iconName,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      label,
                      style: themeData.textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                  height: 50,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  static Widget textFieldWithPrefix(
      {
        required BuildContext context,
        required String hintText,
        required TextEditingController controller,
        required double width,
        required FocusNode focusNode,
        required Function callback,
        required ValueChanged<String> onChanged,
        required Widget prefix
      }
      ) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: themeData.hoverColor,
          border: Border.all(
              color: themeData.colorScheme.onPrimary
          )
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: prefix,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              style: themeData.textTheme.bodySmall,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: themeData.textTheme.bodySmall
              ),
            ),
          )
        ],
      )
    );
  }

  static Widget textFieldWithLabelAndSuffix(
      {
        required BuildContext context,
        required String label,
        required String hintText,
        required TextEditingController controller,
        required double width,
        required FocusNode focusNode,
        required Function callback,
        required ValueChanged<String> onChanged,
        bool isPassword = false, bool hasSuffix = false
      }
    ) {
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: themeData.textTheme.bodyLarge),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(top: 10),
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeData.hoverColor,
            border: Border.all(
              color: themeData.colorScheme.onPrimary
            )
          ),
          child: Center(
            child: TextField(
              obscureText: isPassword,
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              style: themeData.textTheme.bodySmall,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: themeData.textTheme.bodySmall,
                suffix: GestureDetector(
                  child: Icon(
                      Icons.remove_red_eye,
                      color: isPassword ? ColorConst.g900 : Colors.red
                  ),
                  onTap: () {
                    callback();
                  },
                )
              ),
            ),
          ),
        )
      ],
    );
  }

  static Widget textFieldWithLabel(
      {
        required BuildContext context,
        required String label,
        required String hintText,
        required TextEditingController controller,
        required double width,
        required FocusNode focusNode,
        required ValueChanged<String> onChanged,
        bool isPassword = false, bool hasSuffix = false,
        bool isTextArea = false,
      }
      ) {
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: themeData.textTheme.bodyLarge),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          margin: const EdgeInsets.only(top: 10),
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeData.hoverColor,
            border: Border.all(color: themeData.colorScheme.onPrimary)
          ),
          child: Center(
            child: TextField(
              obscureText: isPassword,
              controller: controller,
              focusNode: focusNode,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: onChanged,
              style: themeData.textTheme.bodySmall,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                hintStyle: themeData.textTheme.bodySmall,
              ),
            ),
          ),
        )
      ],
    );
  }

  static Widget textAreaWithLabel(
      {
        required BuildContext context,
        required String label,
        required String hintText,
        required TextEditingController controller,
        required double width,
        required FocusNode focusNode,
        required ValueChanged<String> onChanged,
      }
      ) {
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: themeData.textTheme.bodyLarge),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          margin: const EdgeInsets.only(top: 10),
          width: width,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeData.hoverColor,
              border: Border.all(color: themeData.colorScheme.onPrimary)
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: onChanged,
            style: TextStyle(
                color: ColorConst.g900
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: themeData.textTheme.bodySmall
            ),
          ),
        )
      ],

    );
  }

  static Widget flexibleTextField(
      {
        required BuildContext context,
        required String hintText,
        required TextEditingController controller,
        required FocusNode focusNode,
        required ValueChanged<String> onChanged,
      }
      ) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themeData.hoverColor,
          border: Border.all(color: themeData.colorScheme.onPrimary)
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        style: TextStyle(
            color: themeData.colorScheme.onPrimary
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: themeData.textTheme.bodySmall
        ),
      ),
    );
  }

  static Image loadImageFromAssetName(String name) {
    return Image(
      image: AssetImage(name),
    );
  }

  static Image loadImageFromAssetNameWithColor(String name, Color color) {
    return Image(
      image: AssetImage(name),
      color: color,
    );
  }

  static showShareDialog(ThemeData themeData, BuildContext context) {
    showDialog(
        context: context,
        builder: (dialogCtx) {
          return Dialog(
            child: LayoutBuilder(
                builder: (_, constrain) {
                  return Wrap(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
                        // height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: themeData.hintColor
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Icon(Icons.close, color: themeData.colorScheme.onPrimary),
                              onTap: () {
                                Navigator.pop(dialogCtx);
                              },
                            ),
                            SizedBox(
                              width: constrain.maxWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundColor: themeData.hintColor.withOpacity(0),
                                    child: UtilWidget.loadImageFromAssetName("assets/share.png"),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                      "Share to your friend",
                                      style: themeData.textTheme.bodyMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: CircleAvatar(
                                          backgroundColor: themeData.hoverColor,
                                          child: UtilWidget.loadImageFromAssetName("assets/whatsapp.png"),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: CircleAvatar(
                                          backgroundColor: themeData.hoverColor,
                                          child: UtilWidget.loadImageFromAssetName("assets/telegram.png"),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: CircleAvatar(
                                          backgroundColor: themeData.hoverColor,
                                          child: UtilWidget.loadImageFromAssetName("assets/instagram.png"),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: CircleAvatar(
                                          backgroundColor: themeData.hoverColor,
                                          child: UtilWidget.loadImageFromAssetName("assets/link.png"),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  );
                }
            ),
          );
        }
    );
  }

}