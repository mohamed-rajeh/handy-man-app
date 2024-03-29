import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/model/service_model.dart';
import 'package:ser/helper/function.dart';

import '../../../../components/constant/them.dart';

class Item extends StatelessWidget {
  final Service service;
  const Item({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () => Get.toNamed("/item_details", arguments: service),
            child: CircleAvatar(
              backgroundColor: MyThem.white,
              radius: 35,
              child: service.picture == null || service.picture!.isEmpty
                  ? const Icon(Icons.shape_line)
                  : Image.network(getImageFromServer(service.picture!)),
            )),
        Text(
          service.name!,
          style: MyThem.nfontStyle,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
