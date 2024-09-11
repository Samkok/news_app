import 'package:demo/domain/article/controller/article_detail_controller.dart';
import 'package:demo/utils/route_name.dart';
import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DetailArticlePage extends StatefulWidget {
  const DetailArticlePage({super.key});

  @override
  State<DetailArticlePage> createState() => _DetailArticlePageState();
}

class _DetailArticlePageState extends State<DetailArticlePage> {

  TextEditingController commentController = TextEditingController();
  FocusNode focusNode = FocusNode();

  final articleDetailController = Get.find<ArticleDetailController>();

  double height = 500; // Initial height of the widget
  double maxHeight = 700; // Maximum height of the widget
  double minHeight = 400; // Minimum height of the widget
  Offset startingPoint = const Offset(0, 0); // To track drag start position

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Future.delayed(const Duration(milliseconds: 10), () {
      articleDetailController.closeOverlay();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: GetBuilder<ArticleDetailController>(
        builder: (_) {
          return Stack(
            children: [
              Positioned(
                top: -40,
                child: Container(
                  height: MediaQuery.of(context).size.height * 2 / 3,
                  width: MediaQuery.of(context).size.width,
                  child: const Image(
                    image: AssetImage(
                        "assets/thumbnail.png",
                    ),
                    fit: BoxFit.fill,
                  )
                )
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          color: themeData.colorScheme.onPrimary,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          child: UtilWidget.loadImageFromAssetNameWithColor(
                              "assets/bookmark.png",
                              themeData.colorScheme.onPrimary
                          ),
                        ),
                      ),
                      Builder(
                        builder: (ctx) {
                          return GestureDetector(
                            onTap: () => articleDetailController.moreButtonClick(ctx, _createOverlayEntry(ctx)),
                            child: Icon(
                              Icons.more_vert,
                              color: themeData.colorScheme.onPrimary,
                            ),
                          );
                        }
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: GestureDetector(
                  onVerticalDragStart: (details) {
                    startingPoint = details.globalPosition;
                  },
                  onVerticalDragUpdate: (details) {
                    double dragDistance = details.globalPosition.dy - startingPoint.dy;
                    setState(() {
                      height -= dragDistance;
                      // Constrain height between minHeight and maxHeight
                      height = height.clamp(minHeight, maxHeight);
                    });
                    startingPoint = details.globalPosition;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    decoration: BoxDecoration(
                      color: themeData.hintColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Channel
                          _channel(themeData, "Follow"),
                          // body
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                Text(
                                  "Bitcoin Bull Run ‘May Not Happen Until 2025",
                                  style: themeData.textTheme.bodyLarge,
                                ),
                                // Time
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      RichText(
                                        text: UtilWidget.linkText(
                                            "Business",
                                                () => (),
                                            false,
                                            themeData.primaryColor
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          "1 hour ago",
                                          style: themeData.textTheme.bodySmall,
                                        ),
                                      ),
                                      Wrap(
                                        spacing: 10,
                                        children: [
                                          Icon(
                                            Icons.thumb_up_alt_outlined,
                                            color: themeData.colorScheme.onPrimary,
                                            size: 15,
                                          ),
                                          Text(
                                            "2k liked",
                                            style: themeData.textTheme.bodySmall,
                                          )],
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      """
                                Bitcoin is a crypto asset that is a reference for various altcoins that have currently been launched, so its price movements are an important benchmark that has a major impact on other crypto assets.
                                Start Crypto Asset Investment at Crypto Magic!
                                In 2024, there are many events that are enough to affect the crypto market, starting from the Bitcoin network will experience a reduction in rewards (Halving), the Bitcoin ETF that has been approved, and the Dencun upgrade that will be launched in the near future.
                                Bitcoin as a Trendsetter
                                Bitcoin (BTC) has changed the entire financial system as we know it by being an alternative to centralized, government-controlled economies, the blockchain technology used in cryptocurrencies eliminates the need for centralized intermediaries and puts control back in the hands of users.
                                Its decentralized nature not only challenged conventional notions of financial autonomy, but also spawned a wide array of other alternative cryptocurrencies (altcoins), spreading its influence massively.
                                Therefore, Bitcoin serves as the ultimate benchmark of crypto market trends and conditions. Its price movements can set the tone for other assets in the crypto space, influencing investor confidence in both Bitcoin and altcoins.
                                  """,
                                      style: themeData.textTheme.bodySmall,
                                    ),
                                  )
                                )
                                // Body
                              ],
                            ),
                          ),
                          // comment
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: UtilWidget.flexibleTextField(
                                      context: context,
                                      hintText: "Write a comment",
                                      controller: commentController,
                                      focusNode: focusNode,
                                      onChanged: (value) => ()
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: themeData.hoverColor,
                                    shape: BoxShape.circle
                                  ),
                                  child: Center(
                                    child: UtilWidget.loadImageFromAssetNameWithColor(
                                        "assets/heart.png", themeData.colorScheme.error),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: themeData.hoverColor,
                                      shape: BoxShape.circle
                                  ),
                                  child: Center(
                                    child: UtilWidget.loadImageFromAssetNameWithColor(
                                        "assets/messages.png", themeData.colorScheme.onPrimary),
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
              )
            ],
          );
        }
      ),
    );
  }

  _channel(ThemeData themeData, String label) {
    return GestureDetector(
      onTap: () => (),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: themeData.hoverColor
                ),
                child: UtilWidget.loadImageFromAssetName("assets/bbc.png"),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.toNamed(RouteName.channelDetail),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "BBC News",
                          style: themeData.textTheme.bodyMedium,
                        ),
                        Text(
                          "80,000 followers",
                          style: themeData.textTheme.bodySmall,
                        )

                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: themeData.primaryColor,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: (MediaQuery.of(context).size.width - 40) / 3,
                      child: Text(
                        textAlign: TextAlign.center,
                        label,
                        style: themeData.textTheme.bodyMedium,
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry(BuildContext ctx) {
    RenderBox renderBox = ctx.findRenderObject() as RenderBox;
    ThemeData themeData = Theme.of(ctx);
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) =>
          Positioned(
            left: offset.dx - 120,
            top: offset.dy + size.height + 10,
            // bottom: 100,
            // width: size.width,
            child: Material(
              color: themeData.hoverColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                width: 150,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // direction: Axis.vertical,
                  // spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: () {
                        articleDetailController.closeOverlay();
                        showSetDisplayBottomSheet(context, themeData);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Set Display",
                            style: themeData.textTheme.bodySmall,
                          ),
                          Icon(
                            Icons.text_fields,
                            size: 15,
                            color: themeData.colorScheme.onPrimary
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        articleDetailController.closeOverlay();
                        UtilWidget.showShareDialog(themeData, ctx);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Share",
                            style: themeData.textTheme.bodySmall,
                          ),
                          Icon(
                            Icons.share_outlined,
                            size: 15,
                            color: themeData.colorScheme.onPrimary,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  showSetDisplayBottomSheet(BuildContext context, ThemeData themeData)
  {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.65,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: themeData.hintColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.close,
                            color: themeData.colorScheme.onPrimary,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Custom Your View",
                              style: themeData.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        RichText(text: UtilWidget.linkText(
                            "Reset",
                            () => (),
                            false,
                            themeData.primaryColor
                        ))
                      ],
                    ),
                  ),

                  // Font style
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Wrap(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.vertical,
                      spacing: 10,
                      children: [
                        Text(
                          "Font Style",
                          style: themeData.textTheme.bodyMedium,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                                border: Border.all(color: themeData.hoverColor)
                              ),
                              child: Center(
                                child: Text(
                                  "Serif",
                                  style: themeData.textTheme.bodySmall,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: themeData.primaryColor,
                                  border: Border.all(color: themeData.hoverColor)
                              ),
                              child: Center(
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      size: 15,
                                      color: themeData.colorScheme.onPrimary,
                                    ),
                                    Text(
                                      "Sans",
                                      style: themeData.textTheme.bodySmall,
                                    )
                                  ],
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),

                  // Font size
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Wrap(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.vertical,
                      spacing: 10,
                      children: [
                        Text(
                          "Font Size",
                          style: themeData.textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackShape: NoPaddingTrackShape(), // Use rectangular track
                              trackHeight: 7.0,
                              thumbShape: CustomThumbShape(themeData: themeData), // Custom thumb size
                            ),
                            child: Slider(
                              value: 50,
                              min: 0,
                              max: 100,
                              divisions: 100, // Allows for 1 unit increment
                              label: 50.round().toString(),
                              activeColor: themeData.primaryColor, // Active bar color
                              inactiveColor: themeData.hoverColor, // Inactive bar color
                              onChanged: (double value) {
                                // setState(() {
                                //   _currentVolume = value; // Update the current volume
                                // });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Brightness
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Wrap(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.vertical,
                      spacing: 10,
                      children: [
                        Text(
                          "Brightness",
                          style: themeData.textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackShape: NoPaddingTrackShape(), // Use rectangular track
                              trackHeight: 7.0,
                              thumbShape: CustomThumbShape(themeData: themeData), // Custom thumb size
                            ),
                            child: Slider(
                              value: 50,
                              min: 0,
                              max: 100,
                              divisions: 100, // Allows for 1 unit increment
                              label: 50.round().toString(),
                              activeColor: themeData.primaryColor, // Active bar color
                              inactiveColor: themeData.hoverColor, // Inactive bar color
                              onChanged: (double value) {
                                // setState(() {
                                //   _currentVolume = value; // Update the current volume
                                // });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Theme
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Wrap(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.vertical,
                      spacing: 10,
                      children: [
                        Text(
                          "Font Style",
                          style: themeData.textTheme.bodyMedium,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                  border: Border.all(color: themeData.hoverColor)
                              ),
                              child: Center(
                                child: Text(
                                  "Light",
                                  style: themeData.textTheme.bodySmall,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: themeData.primaryColor,
                                  border: Border.all(color: themeData.hoverColor)
                              ),
                              child: Center(
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      size: 15,
                                      color: themeData.colorScheme.onPrimary,
                                    ),
                                    Text(
                                      "Dark",
                                      style: themeData.textTheme.bodySmall,
                                    )
                                  ],
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: UtilWidget.flexibleButtonFilled(
                        context,
                        "Apply",
                            () => ()
                    )
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }


}

class CustomThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final ThemeData themeData;

  CustomThumbShape({required this.themeData, this.thumbRadius = 10});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    // Paint the custom thumb (example: circular thumb with a border)
    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? themeData.primaryColor
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = themeData.colorScheme.onPrimary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw thumb circle
    canvas.drawCircle(center, thumbRadius, paint);

    // Draw thumb border
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}
class NoPaddingTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 2.0;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

