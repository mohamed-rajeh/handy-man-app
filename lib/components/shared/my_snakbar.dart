import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/components/constant/them.dart';

void showSnackBar(String text) {
  Get.showSnackbar(GetSnackBar(
    messageText: Text(
      text,
      style: MyThem.nfontStyle,
    ),
    backgroundColor: MyThem.primaryColor,
    duration: const Duration(milliseconds: 1500),
    snackPosition: SnackPosition.TOP,
  ));
}
