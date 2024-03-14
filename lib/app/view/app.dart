import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/constant/them.dart';
import 'pages/orders/orders_page.dart';
import 'pages/home/home_page.dart';
import 'pages/profile/profile_page.dart';

List<TabData> tabs = [
  TabData(
      iconData: Icons.person, title: "Profile", tabColor: MyThem.tertiaryColor),
  TabData(iconData: Icons.home, title: "home", tabColor: MyThem.accentColor),
  TabData(
      iconData: FontAwesomeIcons.jediOrder,
      title: "Booking",
      tabColor: MyThem.secondaryColor),
];
List pages = const [ProfilePage(), HomePage(), OrdersPage()];
int _currentPage = 1;
String currentTitle = tabs[_currentPage].title;
Color currentColor = tabs[_currentPage].tabColor!;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ? For what !!!

        resizeToAvoidBottomInset: true,
        backgroundColor: MyThem.wight,
        body: pages[_currentPage],
        bottomNavigationBar: CubertoBottomBar(
          key: const Key("BottomBar"),
          inactiveIconColor: MyThem.secondaryColor,
          tabStyle: CubertoTabStyle.styleNormal,
          selectedTab: _currentPage,
          tabs: tabs
              .map(
                (value) => TabData(
                  key: Key(value.title),
                  iconData: value.iconData,
                  title: value.title,
                  tabColor: value.tabColor,
                  tabGradient: value.tabGradient,
                ),
              )
              .toList(),
          onTabChangedListener: (position, title, color) {
            setState(() {
              _currentPage = position;
              currentTitle = title;
              if (color != null) {
                currentColor = color;
              }
            });
          },
        ));
  }
}
