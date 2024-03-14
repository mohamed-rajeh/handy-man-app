import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/controller/service_controller.dart';
import 'package:ser/app/model/service_model.dart';
import 'package:ser/components/constant/them.dart';

import '../../items_details_page/item_details.dart';

class ItServicePage extends StatelessWidget {
  const ItServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ServiceController serviceController = Get.find();
    return Scaffold(
      backgroundColor: MyThem.wight,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          "IT sevices",
        ),
        centerTitle: true,
        backgroundColor: MyThem.wight,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Obx(() {
          List items = serviceController.services
              .where((element) => element.category == 2) //! shud fix
              .toList();
          return ServicePageItems(
            items: items,
          );
        }),
      ),
    );
  }
}

class ServicePageItems extends StatelessWidget {
  final List items;
  const ServicePageItems({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, mainAxisSpacing: 40, childAspectRatio: .8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          Service s = items[index];
          return ItemDetails(service: s);
        });
  }
}
