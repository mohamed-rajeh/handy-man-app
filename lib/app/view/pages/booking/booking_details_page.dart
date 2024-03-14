// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/components/constant/them.dart';
import 'package:ser/components/shared/my_button.dart';
import 'package:ser/components/shared/my_lable.dart';
import 'package:ser/components/shared/my_text_field.dart';

import '../../../model/service_model.dart';

class BookingDetailsPage extends StatelessWidget {
  const BookingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Service? service = Get.arguments;
    return Scaffold(
      backgroundColor: MyThem.wight,
      appBar: AppBar(
        title: Text("bookingdetails".tr),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.size.height - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image.asset("images/Logo.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyLabel(
                          text: "service".tr,
                          minTextSize: 20,
                        ),
                        Text(
                          service!.name,
                          style: MyThem.nfontStyle,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 16),
                MyLabel(text: "city".tr, minTextSize: 20),
                Text(
                  "from location",
                  style: MyThem.nfontStyle,
                ),
                SizedBox(height: 16),
                MyLabel(text: "streat".tr, minTextSize: 20),
                Text(
                  "from location",
                  style: MyThem.nfontStyle,
                ),
                SizedBox(height: 30),
                MyLabel(text: "phone".tr, minTextSize: 20),
                SizedBox(height: 16),
                MyTextField(
                  hint: "hintPhone".tr,
                ),
                SizedBox(height: 30),
                MyLabel(text: "Note", minTextSize: 20),
                SizedBox(height: 16),
                MyTextField(
                  maxLine: 10,
                  hint: "hintNote".tr,
                ),
                Spacer(),
                MyButton(
                  lable: "submit",
                  color: MyThem.secondaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
