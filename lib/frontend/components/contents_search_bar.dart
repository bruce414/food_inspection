import 'package:flutter/material.dart';

class ContentsSearchBar extends StatefulWidget {
  const ContentsSearchBar({super.key});

  @override
  State<ContentsSearchBar> createState() => _ContentsSearchBarState();
}

class _ContentsSearchBarState extends State<ContentsSearchBar> {

  List foodItems = [
    'rice',
    'fish',
    'cheese',
    'steak',
    'tomato',
    'potato',
    'apple',
    'grapes'
  ];

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context,
          SearchController homeStateSearchController) {
        return SearchBar(
          controller: homeStateSearchController,
          onTap: () {
            homeStateSearchController.openView();
          },
          onChanged: (_) {
            homeStateSearchController.openView();
          },
          // padding: EdgeInsets.symmetric(horizontal: 16.0),
          leading: const Icon(
            Icons.search,
          ),
          hintText: 'Search Recipes',
        );
      },
      suggestionsBuilder: (BuildContext context,
          SearchController homeStateSearchController) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                homeStateSearchController.closeView(item);
              });
            },
          );
        });
      },
    );
  }
}
