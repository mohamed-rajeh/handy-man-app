// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/model/service_model.dart';

import '../items_details_page/item_details.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Service service = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("details".tr),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ItemDetails(
          service: service,
        ),
      ),
    );
  }
}
