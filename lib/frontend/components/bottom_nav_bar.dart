import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_inspection/frontend/pages/camera_page.dart';
import 'package:food_inspection/frontend/pages/recipes_page.dart';
import 'package:food_inspection/frontend/pages/tracker_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  final PersistentTabController _controller = PersistentTabController();
  Settings settings = Settings();

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const TrackerPage(),
      item: ItemConfig(
        icon: const Icon(CupertinoIcons.alarm),
        title: 'tracker',
        activeForegroundColor: Colors.orange,
        inactiveForegroundColor: Colors.grey,
      ),
    ),
    PersistentTabConfig(
      screen: const CameraPage(),
      item: ItemConfig(
        icon: const Icon(
          CupertinoIcons.camera,
          color: Colors.white,
        ),
        title: 'camera',
        activeForegroundColor: Colors.orange,
        inactiveForegroundColor: Colors.grey,
      ),
    ),
    PersistentTabConfig(
      screen: const RecipesPage(),
      item: ItemConfig(
        icon: const Icon(CupertinoIcons.bag),
        title: 'recipes',
        activeForegroundColor: Colors.orange,
        inactiveForegroundColor: Colors.grey,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs(),
      // for customized page transition
      // animatedTabBuilder: (navBarConfig) => ,

      //default page transition
      navBarBuilder: (navBarConfig) => settings.navBarBuilder(
        navBarConfig,
        NavBarDecoration(
          color: settings.navBarColor,
        ),
        const ItemAnimation(),
        const NeumorphicProperties(),
      ),
      hideNavigationBar: settings.hideNavBar,
      popAllScreensOnTapOfSelectedTab:
      settings.popAllScreensOnTapOfSelectedTab,
    );
  }
}

typedef NavBarBuilder = Widget Function(
    NavBarConfig,
    NavBarDecoration,
    ItemAnimation,
    NeumorphicProperties,
);

class Settings {
  bool hideNavBar = false;
  bool resizeToAvoidBottomInset = true;
  bool stateManagement = true;
  bool handleAndroidBackButtonPress = true;
  bool popAllScreensOnTapOfSelectedTab = true;
  bool avoidBottomPadding = true;
  Color navBarColor = Colors.white;
  NavBarBuilder get navBarBuilder => navBarStyles[navBarStyle]!;
  String navBarStyle = "Style 13";
  EdgeInsets margin = EdgeInsets.zero;

  Map<String, NavBarBuilder> navBarStyles = {
    "Style 13": (p0, p1, p2, p3) =>
        Style13BottomNavBar(navBarConfig: p0, navBarDecoration: p1),
  };
}
