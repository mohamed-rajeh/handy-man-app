import 'package:get/get.dart';
import 'package:ser/components/constant/data.dart';

import '../model/notificate_model.dart';

class NotificateServiceController extends GetxController {
  List<Notificate> list = [];

  getData() {
    list.addAll(notificattionsData);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
