import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/controller/service_controller.dart';
import 'package:ser/app/model/category_model.dart';
import 'package:ser/components/constant/them.dart';

class CategoryItem extends StatelessWidget {
  final Category item;
  const CategoryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    ServiceController serviceController = Get.put(ServiceController());
    return InkWell(
      onTap: () => serviceController.checkCat(item.id),
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: MyThem.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(item.name),
      ),
    );
  }
}
