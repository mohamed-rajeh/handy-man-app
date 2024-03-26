import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/model/order_model.dart';
import 'package:ser/app/services/get_orders.dart';

import '../../widget/booking/custom_switch_list_tile.dart';

class CurentOrdersPage extends StatelessWidget {
  const CurentOrdersPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GetBuilder<GetOrdersServiceController>(
              init: GetOrdersServiceController(),
              builder: (con) {
                return ListView.builder(
                    itemCount: con.orders.length,
                    itemBuilder: (context, index) {
                      Order order = con.orders[index];
                      return CustomSwitchListTile(item: order);
                    });
              })),
    );
  }
}
