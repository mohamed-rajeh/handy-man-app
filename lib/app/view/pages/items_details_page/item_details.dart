import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ser/components/shared/my_button.dart';
import 'package:ser/helper/function.dart';

import '../../../../components/constant/them.dart';
import '../../../model/service_model.dart';

part 'item_details_body.dart';
part 'item_details_footer.dart';
part 'item_details_header.dart';

class ItemDetails extends StatelessWidget {
  final Service? service;
  const ItemDetails({
    super.key,
    this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: MyThem.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemHeader(photo: service!.picture),
          const SizedBox(height: 16),
          Expanded(
              child: ItemBody(
            service: service!,
          )),
          const SizedBox(height: 16),
          MyButton(
              onTap: () {
                Get.toNamed("/bookin_location", arguments: service);
              },
              lable: "bookNow".tr,
              color: MyThem.secondaryColor)
        ],
      ),
    );
  }
}
