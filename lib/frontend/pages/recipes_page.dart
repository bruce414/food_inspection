import 'package:flutter/material.dart';
import 'package:food_inspection/frontend/components/contents_search_bar.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 7.0, left: 10.0),
                  child: Text(
                    'Recipes',
                    style: TextStyle(
                      fontFamily: 'Lobster_Two',
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ContentsSearchBar(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
