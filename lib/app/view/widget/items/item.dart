import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/model/service_model.dart';

import '../../../../components/constant/them.dart';

class Item extends StatelessWidget {
  final Service service;
  const Item({super.key, required this.service});

  final String img = "http://10.0.2.2/ser/images/";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: MyThem.secondaryColor,
      onTap: () => Get.toNamed("/item_details", arguments: service),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: MyThem.wight,
            radius: 35,
            child: service.picture == null || service.picture!.isEmpty
                ? const Icon(Icons.shape_line)
                : Image.network(img + service.picture!),
          ),
          Text(
            service.name!,
            style: MyThem.nfontStyle,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
