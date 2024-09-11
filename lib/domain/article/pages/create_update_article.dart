import 'package:demo/domain/article/controller/article_controller.dart';
import 'package:demo/domain/article/model/article_model.dart';
import 'package:demo/utils/color_const.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUpdateArticlePage extends StatefulWidget {

  const CreateUpdateArticlePage({super.key});

  @override
  State<CreateUpdateArticlePage> createState() => _CreateUpdateArticlePageState();
}

class _CreateUpdateArticlePageState extends State<CreateUpdateArticlePage> with TickerProviderStateMixin {

  final articleController = Get.find<ArticleController>();
  ArticleModel? articleModel;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  FocusNode titleFocusNode = FocusNode();
  FocusNode contentFocusNode = FocusNode();

  bool isUpdate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.arguments != null) {
      articleModel = Get.arguments as ArticleModel;
      isUpdate = true;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    contentController.dispose();
    titleFocusNode.dispose();
    contentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    ThemeData themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeData.hintColor,
        appBar: AppBar(
          backgroundColor: themeData.hintColor,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined, color: themeData.colorScheme.onPrimary),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                child: Text(
                  "Draft",
                  style: TextStyle(
                    color: themeData.primaryColor,
                    fontSize: 16
                  ),
                ),
              ),
            )
          ],
          title: Text(
            isUpdate ? "Update Article" : "Create New Article",
            style: themeData.textTheme.bodyLarge,
          ),
        ),
        body: GetBuilder<ArticleController>(
          builder: (_) {
            return Center(
              child: Container(
                color: themeData.hintColor,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image
                            GestureDetector(
                              child: SizedBox(
                                width: width,
                                child: DottedBorder(
                                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                                  color: themeData.colorScheme.onPrimary,
                                  strokeWidth: 1,
                                  dashPattern: const [6,3],
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(10),
                                  child: Center(
                                    child: isUpdate ? UtilWidget.loadImageFromAssetName(articleModel!.img) : Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_search_outlined,
                                          color: themeData.primaryColor,
                                        ),
                                        Text(
                                          "Add Article Cover",
                                          style: TextStyle(
                                            color: themeData.primaryColor
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            // Title
                            UtilWidget.textFieldWithLabel(
                              context: context,
                                label: "Title",
                                hintText: "Write a title...",
                                controller: titleController,
                                width: width,
                                focusNode: titleFocusNode,
                                onChanged: (value) => ()
                            ),
                            const SizedBox(height: 15),
                            // Content
                            UtilWidget.textAreaWithLabel(
                              context: context,
                                label: "Write an article",
                                hintText: "Write something here",
                                controller: contentController,
                                width: width,
                                focusNode: contentFocusNode,
                                onChanged: (value) => ()
                            ),
                            const SizedBox(height: 15),
                            // Category selection
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Category", style: themeData.textTheme.bodyLarge),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  margin: const EdgeInsets.only(top: 10),
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: themeData.hoverColor,
                                      border: Border.all(color: themeData.colorScheme.onPrimary)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Select Category",
                                        style: themeData.textTheme.bodyMedium,
                                      ),
                                      Icon(Icons.arrow_forward_ios_outlined, color: themeData.colorScheme.onPrimary)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            // Audio Article switch
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Switch(
                                    activeColor: ColorConst.mainColor,
                                    inactiveThumbColor: ColorConst.g200,
                                    inactiveTrackColor: ColorConst.g400,
                                    value: articleController.isAudio.value,
                                    onChanged: (value) => articleController.toggleIsAudio(value)
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Audio Article",
                                    style: themeData.textTheme.bodyMedium,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    UtilWidget.buttonFilled(context, width, "Publish", () => ())
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
