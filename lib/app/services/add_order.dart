// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../components/constant/links.dart';
import '../../helper/api.dart';
import '../model/order_model.dart';

class AddOrdersServiceController extends GetxController {
  addOrder(Order order) async {
    try {
      final response =
          await Api().post(url: addOrdersLink, body: order.toMap());

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
