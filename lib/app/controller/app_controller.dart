import 'package:cuberto_bottom_bar/internal/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ser/app/services/get_serviecs.dart';

import '../../components/constant/them.dart';
import '../view/pages/home/home_page.dart';
import '../view/pages/orders/orders_page.dart';
import '../view/pages/profile/profile_page.dart';

class AppController extends GetxController {
  bool isLoding = false;

  late int? page =
      Get.arguments != null ? Get.arguments["current page"] as int : null;

  final GetServicesController _servicesController =
      Get.put(GetServicesController());
  List<TabData> tabs = [
    TabData(
        iconData: Icons.person,
        title: "Profile",
        tabColor: MyThem.tertiaryColor),
    TabData(iconData: Icons.home, title: "Home", tabColor: MyThem.accentColor),
    TabData(
        iconData: FontAwesomeIcons.jediOrder,
        title: "Orders",
        tabColor: MyThem.secondaryColor),
  ];
  List pages = const [ProfilePage(), HomePage(), OrdersPage()];

  int currentPage = 1;
  late String currentTitle = tabs[currentPage].title;
  late Color currentColor = tabs[currentPage].tabColor!;

  initData() async {
    isLoding = true;
    update();
    await _servicesController.parseServices();
    isLoding = false;
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
