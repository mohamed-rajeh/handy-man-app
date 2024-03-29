import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/services/get_serviecs.dart';
import 'package:ser/app/model/service_model.dart';
import 'package:ser/components/constant/them.dart';

import '../../../widget/home/home_service_item_details.dart';

class HandyManServicePage extends StatelessWidget {
  static const String id = "/handyman_service";
  const HandyManServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GetServicesController serviceController = Get.find();
    return Scaffold(
      backgroundColor: MyThem.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          "Hand Man",
        ),
        centerTitle: true,
        backgroundColor: MyThem.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<GetServicesController>(builder: (con) {
          List items = serviceController.services
              .where((element) => element.category == 1)
              .toList();
          return HandManServicePageItems(
            items: items,
          );
        }),
      ),
    );
  }
}

class HandManServicePageItems extends StatelessWidget {
  final List items;
  const HandManServicePageItems({
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
