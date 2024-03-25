import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/constant/links.dart';
import '../../../../components/constant/them.dart';
import '../../../model/service_model.dart';

class HomeServiceItemDetails extends StatelessWidget {
  final Service? service;
  const HomeServiceItemDetails({
    super.key,
    this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(5, 5),
            spreadRadius: -5)
      ]),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: MyThem.white,
        elevation: 0,
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
                      style: MyThem.nfontStyle
                          .copyWith(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
