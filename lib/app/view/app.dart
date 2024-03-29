import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ser/app/controller/app_controller.dart';

import '../../components/constant/them.dart';

class App extends StatefulWidget {
  static const String id = "/";
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // it well come from order details page
    // if user sent an order

    return GetBuilder<AppController>(
        init: AppController(),
        builder: (controller) {
          return ModalProgressHUD(
            color: MyThem.tertiaryColor,
            inAsyncCall: controller.isLoding,
            progressIndicator: CircularProgressIndicator(
              color: MyThem.primaryColor,
            ),
            child: Scaffold(

                // ? For what !!!
                resizeToAvoidBottomInset: true,
                backgroundColor: MyThem.white,
                body: controller.pages[controller.currentPage],
                bottomNavigationBar: CubertoBottomBar(
                  key: const Key("BottomBar"),
                  inactiveIconColor: MyThem.secondaryColor,
                  tabStyle: CubertoTabStyle.styleNormal,
                  selectedTab: controller.currentPage,
                  tabs: controller.tabs
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
                      controller.currentPage = position;
                      controller.currentTitle = title;
                      if (color != null) {
                        controller.currentColor = color;
                      }
                    });
                  },
                )),
          );
        });
  }
}
