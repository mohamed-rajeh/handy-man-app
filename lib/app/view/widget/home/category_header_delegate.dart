import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/components/shared/my_lable.dart';

import '../../../../components/constant/them.dart';
import '../../../controller/service_controller.dart';
import '../../../model/category_model.dart';
import '../items/cotagrs_list.dart';

class CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  final ServiceController _serviceController = Get.find();
  List<Category> cot = [
    Category(id: 0, name: "All"),
    Category(id: 1, name: "Home"),
    Category(id: 2, name: "IT"),
  ];
  @override
  double get minExtent => 80.0; // Minimum height of the header

  @override
  double get maxExtent => 80.0; // Maximum height of the header

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    bool shouldShowHeader =
        shrinkOffset > 0 || _serviceController.isAll.isFalse;
    // You can customize this widget to display your category information
    return Container(
      height: 80,
      color: MyThem.wight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (shouldShowHeader)
            for (int i = 0; i < cot.length; i++)
              Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Obx(() {
                    return CategoryItem(
                      color: _serviceController.selectedCategory.value == i
                          ? MyThem.secondaryColor
                          : MyThem.primaryColor,
                      item: cot[i],
                    );
                  }))
          else
            const MyLabel(text: "Puperl", minTextSize: 20)
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
