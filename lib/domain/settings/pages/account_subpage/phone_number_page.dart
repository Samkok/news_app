import 'package:demo/domain/settings/controller/phone_number_controller.dart';
import 'package:demo/domain/settings/model/country_code_model.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_const.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {

  final phoneNumberController = Get.find<PhoneNumberController>();

  List<CountryCodeModel> countryCodes = [
    CountryCodeModel(code: "US", dialCode: "+2", flag: "assets/profile.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "United State", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
    CountryCodeModel(code: "US", dialCode: "+1", flag: "assets/usa_flag.png"),
  ];

  TextEditingController numberController = TextEditingController();
  FocusNode numberFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    Future.delayed(const Duration(milliseconds: 10), () {
      phoneNumberController.closeOverlay();
    });
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
          "Phone Number",
          style: themeData.textTheme.bodyLarge,
        ),
      ),
      body: GetBuilder<PhoneNumberController>(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number", style: themeData.textTheme.bodyLarge),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          margin: const EdgeInsets.only(top: 10),
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: themeData.hoverColor
                          ),
                          child: Row(
                            children: [
                              Builder(
                                builder: (ctx) {
                                  return GestureDetector(
                                    onTap: () => phoneNumberController.buttonClick(ctx,_createOverlayEntry(ctx)),
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                                      padding: const EdgeInsets.all(10),
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: themeData.hintColor,
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ClipOval(
                                            child: UtilWidget.loadImageFromAssetName(phoneNumberController.selectedCode.value == null ? "assets/usa_flag.png" : phoneNumberController.selectedCode.value!.flag),
                                          ),
                                          Icon(Icons.keyboard_arrow_down, color: themeData.colorScheme.onPrimary)
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              ),
                              Expanded(
                                child: TextField(
                                  controller: numberController,
                                  focusNode: numberFocusNode,
                                  // onChanged: onChanged,
                                  style: themeData.textTheme.bodySmall,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: phoneNumberController.selectedCode == Rxn(null) ? "+1" : "${phoneNumberController.selectedCode.value!.dialCode} 1234567",
                                    hintStyle: themeData.textTheme.bodySmall
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                ),
                UtilWidget.buttonFilled(context, width, "Change Phone Number", () => ())
              ],
            ),
          );
        }
      ),
    );
  }

  OverlayEntry _createOverlayEntry(BuildContext ctx) {
    RenderBox renderBox = ctx.findRenderObject() as RenderBox;
    ThemeData themeData = Theme.of(ctx);
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx - 10,
        top: offset.dy + size.height + 10,
        bottom: 100,
        // width: size.width,
        child: GetBuilder<PhoneNumberController>(
            builder: (_) {
              return Material(
                color: themeData.hoverColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: countryCodes.map((item) {
                      return GestureDetector(
                        onTap: () => phoneNumberController.selectCode(item),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipOval(
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: UtilWidget.loadImageFromAssetName(item.flag),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    item.code,
                                    style: themeData.textTheme.bodySmall,
                                  ),
                                ),
                                Text(
                                  item.dialCode,
                                  style: themeData.textTheme.bodySmall,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

}

