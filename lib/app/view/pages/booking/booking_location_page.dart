// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ser/components/constant/them.dart';
import 'package:ser/components/shared/my_button.dart';
import 'package:ser/components/shared/my_text_field.dart';

import '../../../../components/shared/my_lable.dart';
import '../../../model/service_model.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Service? service = Get.arguments;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text("location".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: MyThem.secondaryColor),
                      borderRadius: BorderRadius.circular(20)),
                  child: AspectRatio(
                    aspectRatio: 16 / 12,
                    child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.location_on,
                          color: MyThem.secondaryColor,
                          size: 100,
                        )),
                  ),
                ),
                SizedBox(height: 30),
                MyLabel(text: "Note", minTextSize: 20),
                SizedBox(height: 16),
                MyTextField(
                  maxLine: 10,
                  hint: "hintLocationNote".tr,
                ),
                Spacer(),
                MyButton(
                    onTap: () =>
                        Get.toNamed("/booking_details", arguments: service),
                    lable: "contenuu",
                    color: MyThem.secondaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
