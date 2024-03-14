import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/components/constant/them.dart';
import 'package:ser/components/shared/my_button.dart';
import 'package:ser/components/shared/my_lable.dart';
import 'package:ser/components/shared/my_text_field.dart';

class LocationSettingPage extends StatelessWidget {
  const LocationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("location".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyLabel(text: "city".tr, minTextSize: 18),
            const SizedBox(height: 16),
            MyTextField(hint: "cityHint".tr),
            const SizedBox(height: 16),
            MyLabel(text: "sreat".tr, minTextSize: 18),
            const SizedBox(height: 16),
            MyTextField(hint: "streatHint".tr),
            const SizedBox(height: 30),
            MyLabel(text: "note".tr, minTextSize: 18),
            const SizedBox(height: 16),
            MyTextField(
              maxLine: 10,
              hint: "noteHint".tr,
            ),
            const Spacer(),
            MyButton(lable: "save".tr, color: MyThem.secondaryColor)
          ],
        ),
      ),
    );
  }
}
