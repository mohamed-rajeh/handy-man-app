import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ser/app/view/app.dart';
import 'package:ser/app/view/pages/booking/booking_details_page.dart';
import 'package:ser/app/view/pages/booking/booking_location_page.dart';
import 'package:ser/app/view/pages/home/it_section/it_service_page.dart';
import 'package:ser/app/view/pages/home/item_details_page.dart';
import 'package:ser/app/view/pages/orders/orders_page.dart';

import 'app/controller/app_controller.dart';
import 'app/view/pages/home/handyman_section/handyman_service_page.dart';

void main() {
  Get.put(AppController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: const Locale("ar"),
      debugShowCheckedModeBanner: false,
      title: 'Server App',
      getPages: [
        GetPage(name: App.id, page: () => const App()),
        GetPage(name: ItServicePage.id, page: () => const ItServicePage()),
        GetPage(
            name: HandyManServicePage.id,
            page: () => const HandyManServicePage()),
        GetPage(name: "/more_section", page: () => const ItServicePage()),
        GetPage(name: ItemDetailsPage.id, page: () => const ItemDetailsPage()),
        GetPage(name: BookingPage.id, page: () => const BookingPage()),
        GetPage(name: OrdersPage.id, page: () => const OrdersPage()),
        GetPage(
          name: BookingDetailsPage.id,
          page: () => const BookingDetailsPage(),
        )
      ],
    );
  }
}
