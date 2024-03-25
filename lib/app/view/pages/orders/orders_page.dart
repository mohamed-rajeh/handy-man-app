// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ser/app/view/pages/orders/old_orders_page.dart';

import 'package:ser/components/constant/them.dart';

import '../../widget/booking/tab_button.dart';
import 'curent_orders_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<OrdersPage> {
  List<Widget> pages = [
    CurentOrdersPage(),
    OldOrdersPage(),
  ];
  List<Widget> tabs = [
    MyTabButton(
      title: "Current Orders",
    ),
    MyTabButton(
      title: "Old Orders",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyThem.white,
            foregroundColor: MyThem.secondaryColor,
            title: Text("Booking"),
            centerTitle: true,
            bottom: TabBar(
                dividerColor: MyThem.white,
                labelColor: MyThem.white,
                indicatorColor: MyThem.white,
                indicator: BoxDecoration(
                    color: MyThem.secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                tabs: tabs),
          ),
          body: TabBarView(children: pages)),
    );
  }
}
