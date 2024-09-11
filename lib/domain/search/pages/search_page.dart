import 'package:demo/widgets/util_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  List<String> recentSearches = [
    "FIFA World Cup", "academic award", "New sport around city", "Pandemic"
  ];

  List<String> tags = [
    "#news", "#today", "#stock", "#crypto", "#business",
  ];

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.hintColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
              },
              child: Icon(Icons.more_vert, color: themeData.colorScheme.onPrimary),
            ),
          )
        ],
        title: Text(
          "Search",
          style: themeData.textTheme.bodyLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              margin: const EdgeInsets.only(bottom: 10),
              // width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: themeData.hoverColor,
                  border: Border.all(color: themeData.hoverColor)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search, color: themeData.colorScheme.onPrimary),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: searchController,
                        focusNode: searchFocusNode,
                        onChanged: (value) => (),
                        style: themeData.textTheme.bodySmall,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: themeData.textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: UtilWidget.loadImageFromAssetNameWithColor("assets/filter.png", themeData.primaryColor),
                  )
                ],
              ),
            ),

            // Recent Search
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Recent Search",
                      style: themeData.textTheme.bodyMedium,
                    ),
                  ),
                  Divider(thickness: 1, color: themeData.hoverColor),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: recentSearches.length,
                    itemBuilder: (context, index) {
                      String recent = recentSearches[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              recent,
                              style: themeData.textTheme.bodySmall,
                            ),
                            GestureDetector(
                              child: Icon(Icons.close, size: 15, color: themeData.colorScheme.onPrimary),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Popular Tags
            Divider(thickness: 1, color: themeData.hoverColor),
            tagsView(themeData, MediaQuery.of(context).size.width),
            Divider(thickness: 1, color: themeData.hoverColor),
            Text(
              "Hot News 🔥",
              style: themeData.textTheme.bodyMedium,
            ),
            // Hot news
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return hotNewsItem(themeData);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  hotNewsItem(ThemeData themeData) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sir Keir Starmer cleared by",
                    style: themeData.textTheme.bodyMedium,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Labour leader Sir Keir Starmer and deputy Angela Rayner have been cleared by Durham Police of breaking lockdown rules",
                    style: themeData.textTheme.bodySmall,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "January 27, 2024",
                          style: themeData.textTheme.bodySmall,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(Icons.do_not_disturb_on_total_silence, size: 5, color: themeData.colorScheme.onPrimary,),
                        ),
                        Text(
                          "Politics",
                          style: themeData.textTheme.bodySmall,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          UtilWidget.loadImageFromAssetName("assets/hotnews1.png")
        ],
      ),
    );
  }

  tagsView(ThemeData themeData, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Tags",
          style: themeData.textTheme.bodyMedium,
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: width,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(tags.length, (index) {
                String tag = tags[index];
                return tagItem(themeData, tag);
              }
              ),
            )
        )
      ],
    );
  }

  tagItem(ThemeData themeData, String tag) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: themeData.hoverColor
          )
      ),
      child: Text(
        tag,
        style: themeData.textTheme.bodySmall,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

}
