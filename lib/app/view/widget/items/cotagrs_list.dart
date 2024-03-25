import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/services/get_serviecs.dart';
import 'package:ser/app/model/category_model.dart';
import 'package:ser/components/constant/them.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final Category item;
  const CategoryItem({super.key, required this.item, required this.color});

  @override
  Widget build(BuildContext context) {
    GetServicesController serviceController = Get.put(GetServicesController());
    return InkWell(
      onTap: () => serviceController.checkCat(item.id),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          item.name,
          style: MyThem.tfontStyle.copyWith(
            color: color == MyThem.secondaryColor ? MyThem.white : MyThem.black,
          ),
        ),
      ),
    );
  }
}
