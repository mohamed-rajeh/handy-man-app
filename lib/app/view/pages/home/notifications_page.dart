// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ser/components/constant/them.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                centerTitle: true,
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios),
                ),
                title: Text("Notifications"),
              ),
              SizedBox(
                height: 30,
              ),
              NotiticateListTile()
            ],
          ),
        ),
      ),
    );
  }
}

class NotiticateListTile extends StatelessWidget {
  const NotiticateListTile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyThem.wight,
      child: ListTile(
        leading: Icon(Icons.notifications_on),
        title: Text(
          "Notificat 1",
          style: MyThem.nfontStyle,
        ),
        trailing: Timeago(
          builder: (_, value) => Text(value),
          date: DateTime.parse("2024-01-20"),
        ),
      ),
    );
  }
}
