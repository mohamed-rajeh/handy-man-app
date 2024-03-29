import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/app/model/order_model.dart';
import 'package:ser/app/services/get_orders.dart';

import '../../../../components/constant/them.dart';
import '../../widget/order/custom_switch_list_tile.dart';

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
                return RefreshIndicator(
                  color: MyThem.secondaryColor,
                  displacement: 50,
                  onRefresh: () async {
                    await con.getOrders();
                  },
                  child: ListView.builder(
                      itemCount: con.orders.length,
                      itemBuilder: (context, index) {
                        Order order = con.orders[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CustomSwitchListTile(item: order),
                        );
                      }),
                );
              })),
    );
  }
}
