// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ser/app/model/notificate_model.dart';
import 'package:ser/components/constant/them.dart';
import 'package:timeago_flutter/timeago_flutter.dart';

import '../../../services/notificat_service.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThem.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios),
                ),
                title: Text("Notifications"),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: GetBuilder<NotificateServiceController>(
                    init: NotificateServiceController(),
                    builder: (controller) {
                      return ListView.builder(
                        padding: EdgeInsets.only(top: 20),
                        scrollDirection: Axis.vertical,
                        itemCount: controller.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          Notificate noti = controller.list[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: NotiticateListTile(
                              notification: noti,
                            ),
                          );
                        },
                      );
                    }),
              ),
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
    required this.notification,
  });
  final Notificate notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: MyThem.grey, blurRadius: 10, spreadRadius: -4)
      ]),
      child: Card(
        elevation: 0,
        color: MyThem.white,
        child: ListTile(
          leading: Icon(Icons.notifications_on),
          title: Text(
            notification.content,
            style: MyThem.nfontStyle,
          ),
          trailing: Timeago(
            builder: (_, value) => Text(value),
            date: notification.time,
          ),
        ),
      ),
    );
  }
}
