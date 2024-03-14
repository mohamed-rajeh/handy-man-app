import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/view/app.dart';
import 'package:ser/app/view/pages/booking/booking_details_page.dart';
import 'package:ser/app/view/pages/booking/booking_location_page.dart';
import 'package:ser/app/view/pages/home/it_section/it_service_page.dart';
import 'package:ser/app/view/pages/home/item_details_page.dart';

import 'app/view/pages/home/handyman_section/handyman_service_page.dart';

void main() {
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
        GetPage(name: "/", page: () => const App()),
        GetPage(name: "/it_section", page: () => const ItServicePage()),
        GetPage(
            name: "/handyman_service", page: () => const HandyManServicePage()),
        GetPage(name: "/more_section", page: () => const ItServicePage()),
        GetPage(name: "/item_details", page: () => const ItemDetailsPage()),
        GetPage(name: "/bookin_location", page: () => const BookingPage()),
        GetPage(
            name: "/booking_details", page: () => const BookingDetailsPage())
      ],
    );
  }
}
