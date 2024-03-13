import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/view/app.dart';
import 'package:ser/app/view/pages/home/service_page.dart';
import 'package:ser/app/view/pages/home/item_details_page.dart';

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
        GetPage(name: "/it_section", page: () => const ServicePage()),
        GetPage(name: "/home_section", page: () => const ServicePage()),
        GetPage(name: "/more_section", page: () => const ServicePage()),
        GetPage(name: "/item_details", page: () => const ItemDetailsPage()),
        // GetPage(name: "/more", page: () => const App()),
      ],
    );
  }
}
