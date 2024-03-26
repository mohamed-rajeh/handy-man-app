// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../components/constant/links.dart';
import '../../helper/api.dart';
import '../model/order_model.dart';

class GetOrdersServiceController extends GetxController {
  List<Order> orders = [];
  late List data;
  parseServices() async {
    final response = await Api().get(url: getOrders);

    if (response["status"] != "error") {
      data = response['data'] as List<dynamic>;
    } else {
      return;
    }

    List<Order> iterable = data
        .map((order) => Order.fromMap(order as Map<String, dynamic>))
        .toList();
    print(iterable.length);
    orders.addAll(iterable);
    update();
  }

  @override
  void onInit() {
    parseServices();
    super.onInit();
  }
}
