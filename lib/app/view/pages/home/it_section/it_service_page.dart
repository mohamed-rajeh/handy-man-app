import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ser/app/model/service_model.dart';
import 'package:ser/app/services/get_serviecs.dart';
import 'package:ser/app/view/widget/home/home_service_item_details.dart';
import 'package:ser/components/constant/them.dart';

class ItServicePage extends StatelessWidget {
  static const String id = "/it_section";
  const ItServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThem.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          "IT sevices",
        ),
        centerTitle: true,
        backgroundColor: MyThem.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: GetBuilder<GetServicesController>(
            init: GetServicesController(),
            builder: (serviceController) {
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
            crossAxisCount: 2,
            mainAxisSpacing: 40,
            crossAxisSpacing: 10,
            childAspectRatio: .8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          Service s = items[index];
          return HomeServiceItemDetails(service: s);
        });
  }
}
