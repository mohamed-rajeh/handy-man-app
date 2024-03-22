import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/controller/service_controller.dart';
import 'package:ser/app/model/service_model.dart';
import 'package:ser/components/constant/links.dart';
import 'package:ser/components/constant/them.dart';

class HandyManServicePage extends StatelessWidget {
  const HandyManServicePage({
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
          "Hand Man",
        ),
        centerTitle: true,
        backgroundColor: MyThem.wight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ServiceController>(builder: (con) {
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

class HomeServiceItemDetails extends StatelessWidget {
  final Service? service;
  const HomeServiceItemDetails({
    super.key,
    this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: MyThem.wight,
      child: InkWell(
        splashColor: MyThem.secondaryColor,
        onTap: () => Get.toNamed("/item_details", arguments: service),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child:
                      service!.picture != null && service!.picture!.isNotEmpty
                          ? Image.network(imagesUri + service!.picture!)
                          : Image.asset("images/Logo.png")),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service!.name!,
                    overflow: TextOverflow.ellipsis,
                    style:
                        MyThem.nfontStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    service!.description!,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
