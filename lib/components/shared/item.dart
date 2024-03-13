import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/model/service_model.dart';

import '../constant/them.dart';

class Item extends StatelessWidget {
  final Service service;
  const Item({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed("item_details", arguments: service);
          },
          child: CircleAvatar(
            backgroundColor: MyThem.primaryColor,
            radius: 35,
            child: const Icon(Icons.shape_line),
          ),
        ),
        AutoSizeText(
          service.name,
        )
      ],
    );
  }
}
