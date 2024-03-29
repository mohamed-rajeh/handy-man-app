import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../components/shared/my_snakbar.dart';
import '../model/order_model.dart';
import '../services/add_order.dart';

class BookingDetailsPageController extends GetxController {
  final TextEditingController orderNote = TextEditingController();
  final TextEditingController orderPhone = TextEditingController();

  final addOrderController = Get.put(AddOrdersServiceController());
  bool isLoding = false;
  final Order order = Get.arguments["order"];
  final Placemark location = Get.arguments["location"];
  Future<dynamic> addOrder(BuildContext context) async {
    try {
      // Update UI to indicate adding process
      isLoding = true;
      update();
      await Future.delayed(const Duration(seconds: 3));
      // Create the Order object
      Order or = createOrder();

      // Add the order
      var response = await addOrderController.addOrder(or);
      return response;
      // Show dialog based on response status

      // showResponseDialog(context, response);
    } catch (e) {
      // Show error message if an exception occurs
      showSnackBar(e.toString());
    } finally {
      // Update UI to indicate adding process is complete
      isLoding = false;
      update();
    }
  }

  Order createOrder() {
    return Order(
      custmor: 3,
      service: order.service,
      phone: orderPhone.text,
      lat: order.lat,
      long: order.long,
      date: DateTime.now(),
      note: orderNote.text,
      locationNote: order.locationNote,
    );
  }

  // AwesomeDialog(
  //   context: context,
  //   dialogType: DialogType.success,
  //   animType: AnimType.rightSlide,
  //   title: title,
  //   desc: message,
  //   btnOkOnPress: () {
  //     Get.offNamed(OrdersPage.id);
  //   },
  // ).show();
}













  // Future<void> addOrder(BuildContext context) async {
  //   adding = true;
  //   update();
  //   Order or = Order(
  //     custmor: 2,
  //     service: order.service,
  //     phone: orderPhone.text,
  //     lat: order.lat,
  //     long: order.long,
  //     date: DateTime.now(),
  //     note: orderNote.text,
  //     locationNote: order.locationNote,
  //   );
  //   try {
  //     var respons = await addOrderController.addOrder(or);
 
  //         return showAwesomeDialog(
  //             context,
  //             respons["status"],
  //             respons["status"] == "success"
  //                 ? "msgOrderDone".tr
  //                 : "msgOrderField".tr);
       
  //   } catch (e) {
  //     showSnackBar(e.toString());
  //   }
  //   adding = false;
  //   update();
  // }
