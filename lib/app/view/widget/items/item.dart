import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/model/service_model.dart';

import '../../../../components/constant/them.dart';

class Item extends StatelessWidget {
  final Service service;
  const Item({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: MyThem.secondaryColor,
      onTap: () => Get.toNamed("/item_details", arguments: service),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: MyThem.primaryColor,
            radius: 35,
            child: const Icon(Icons.shape_line),
          ),
          Text(
            service.name,
            style: MyThem.nfontStyle,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
