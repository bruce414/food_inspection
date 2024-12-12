import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentsSearchBar extends StatefulWidget {
  const ContentsSearchBar({super.key});

  @override
  State<ContentsSearchBar> createState() => _ContentsSearchBarState();
}

class _ContentsSearchBarState extends State<ContentsSearchBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => TextField(

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color(0xFFEEEBEB),
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.search,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Search Recipes',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

