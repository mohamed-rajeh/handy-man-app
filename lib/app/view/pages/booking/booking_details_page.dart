// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:ser/app/controller/booking_details_page_controller.dart';
import 'package:ser/app/view/app.dart';

import 'package:ser/components/constant/them.dart';

import 'package:ser/components/shared/my_lable.dart';

import 'package:ser/components/shared/my_text_field.dart';
import 'package:ser/helper/function.dart';

class BookingDetailsPage extends StatefulWidget {
  static const String id = "/booking_details";
  const BookingDetailsPage({super.key});

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  ButtonState? state = ButtonState.idle;
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BookingDetailsPageController());

    return GetBuilder<BookingDetailsPageController>(
        init: BookingDetailsPageController(),
        builder: (controller) {
          return ModalProgressHUD(
            inAsyncCall: controller.isLoding,
            progressIndicator: CircularProgressIndicator(
              color: Colors.transparent,
            ),
            child: Scaffold(
              backgroundColor: MyThem.white,
              appBar: AppBar(
                title: Text("bookingdetails".tr),
                centerTitle: true,
                scrolledUnderElevation: 0,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              child: controller.order.service!.picture == null
                                  ? Image.asset("images/Logo.png")
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(getImageFromServer(
                                          controller.order.service!.picture!)),
                                    ),
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
                                  controller.order.service!.name!,
                                  style: MyThem.nfontStyle,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        MyLabel(text: "city".tr, minTextSize: 20),
                        Text(
                          controller.location.locality!,
                          style: MyThem.nfontStyle,
                        ),
                        SizedBox(height: 16),
                        MyLabel(text: "area".tr, minTextSize: 20),
                        Text(
                          controller.location.subAdministrativeArea!,
                          style: MyThem.nfontStyle,
                        ),
                        SizedBox(height: 30),
                        MyLabel(text: "phone".tr, minTextSize: 20),
                        SizedBox(height: 16),
                        MyTextField(
                          controller: controller.orderPhone,
                          keyboardType: TextInputType.phone,
                          validator: (value) =>
                              value!.isEmpty ? "cant be empty" : null,
                          hint: "hintPhone".tr,
                        ),
                        SizedBox(height: 30),
                        MyLabel(text: "Note", minTextSize: 20),
                        SizedBox(height: 16),
                        MyTextField(
                          controller: controller.orderNote,
                          maxLine: 6,
                          hint: "hintNote".tr,
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: ProgressButton.icon(
                              maxWidth: Get.size.width,
                              radius: 10.0,
                              iconedButtons: {
                                ButtonState.idle: IconedButton(
                                    text: "Order",
                                    icon: Icon(Icons.send, color: Colors.white),
                                    color: MyThem.secondaryColor),
                                ButtonState.loading: IconedButton(
                                    text: "Loading",
                                    color:
                                        MyThem.secondaryColor.withAlpha(150)),
                                ButtonState.fail: IconedButton(
                                    text: "Failed",
                                    icon:
                                        Icon(Icons.cancel, color: Colors.white),
                                    color: Colors.red.shade300),
                                ButtonState.success: IconedButton(
                                    text: "Success",
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                    ),
                                    color: Colors.green.shade400)
                              },
                              onPressed: () async {
                                if (state != ButtonState.success) {
                                  state = ButtonState.loading;
                                  setState(() {});
                                  var response =
                                      await controller.addOrder(context);
                                  if (response["status"] == "success") {
                                    state = ButtonState.success;
                                  } else {
                                    state = ButtonState.fail;
                                  }
                                  setState(() {});
                                } else {
                                  int ordersPage = 2; // the index in tap list
                                  Get.offAllNamed(App.id,
                                      arguments: {"current page": ordersPage});
                                }

                                // Get.dialog(
                                //     barrierDismissible: false,
                                //     MyDialog(
                                //       titel: "response[" "]",
                                //     ));
                              },
                              state: state),
                        ),
                        // MyButton(
                        //   lable: "submit",
                        //   onTap: ()
                        //   color: MyThem.secondaryColor,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
