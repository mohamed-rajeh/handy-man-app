// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:ser/components/constant/data.dart';
import 'package:ser/components/constant/links.dart';
import 'package:ser/helper/api.dart';

import '../model/service_model.dart';

class GetServicesController extends GetxController {
  List services = [];
  var isAll = true.obs;
  var selectedCategory = 0.obs;

  checkCat(cat) {
    selectedCategory.value = cat;
    isAll.value = cat == 0;
  }

  getService() {
    // This well return the puperal service then rest
    services.addAll(servicesData);
  }

  parseServices() async {
    final response = await Api().get(url: getAllServeces);
    final data = response['data'] as List<dynamic>;
    List<Service> iterable = data
        .map((service) => Service.fromJson(service as Map<String, dynamic>))
        .toList();
    print(iterable.length);
    services.addAll(iterable);
    update();
  }

  @override
  void onInit() {
    // getService();
    parseServices();
    super.onInit();
  }
}
