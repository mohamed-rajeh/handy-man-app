import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  double get minExtent => 60.0; // Minimum height of the header

  @override
  double get maxExtent => 60.0; // Maximum height of the header

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    bool shouldShowHeader =
        shrinkOffset > 0 || _serviceController.isAll.isFalse;
    // You can customize this widget to display your category information
    return shouldShowHeader
        ? Container(
            height: 60,
            color: MyThem.wight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var i in cot)
                  Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: CategoryItem(
                        item: i,
                      ))
              ],
            ),
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Pupler",
              style: TextStyle(
                  color: MyThem.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
