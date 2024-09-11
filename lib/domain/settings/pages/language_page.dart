import 'package:demo/domain/settings/controller/language_controller.dart';
import 'package:demo/domain/settings/model/language_model.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_const.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  List<LanguageModel> languages = [
    LanguageModel(flagImg: "assets/usa_flag.png", language: "English"),
    LanguageModel(flagImg: "assets/usa_flag.png", language: "Khmer"),
    LanguageModel(flagImg: "assets/usa_flag.png", language: "Japanese"),
    LanguageModel(flagImg: "assets/usa_flag.png", language: "Korean"),
  ];

  final languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeData.hintColor,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, color: themeData.colorScheme.onPrimary),
          ),
          centerTitle: true,
          title: Text(
            "Language",
            style: themeData.textTheme.bodyLarge,
          ),
        ),
        backgroundColor: themeData.hintColor,
        body: GetBuilder<LanguageController>(
          builder: (_) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                separatorBuilder: (_, i) => Divider(thickness: 1, color: ColorConst.g300),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              padding: const EdgeInsets.only(right: 10),
                              child: UtilWidget.loadImageFromAssetName(languages[index].flagImg),
                            ),
                            Text(
                              languages[index].language,
                              style: themeData.textTheme.bodySmall,
                            )
                          ],
                        ),
                        Radio<LanguageModel>(
                          value: languages[index],
                          groupValue: languageController.selectedLanguage?.value,
                          activeColor: themeData.primaryColor,
                          fillColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return themeData.primaryColor;
                              }
                              return themeData.hoverColor; // Default color
                            },
                          ),
                          onChanged: (value) => languageController.setLanguage(value!),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        )
    );
  }
}
