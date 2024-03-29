// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:ser/components/constant/data.dart';
import 'package:ser/components/constant/links.dart';
import 'package:ser/helper/api.dart';

import '../model/service_model.dart';

class GetServicesController extends GetxController {
  List services = [];

  getService() {
    // This well return the puperal service then rest
    services.addAll(servicesData);
  }

  parseServices() async {
    try {
      final iterable = await getServices();

      services.addAll(iterable);
    } catch (e) {
      rethrow;
    }

    update();
  }

  Future<List<Service>> getServices() async {
    await Future.delayed(const Duration(seconds: 3));
    final response = await Api().get(url: getAllServecesLink);
    final data = response['data'] as List<dynamic>;
    List<Service> iterable = data
        .map((service) => Service.fromMap(service as Map<String, dynamic>))
        .toList();
    return iterable;
  }
}
