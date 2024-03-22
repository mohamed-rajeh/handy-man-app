// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:ser/components/constant/data.dart';
import 'package:ser/components/constant/links.dart';

import '../model/service_model.dart';
import 'package:http/http.dart' as http;

class ServiceController extends GetxController {
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

  Future<Map> fetchService() async {
    print("started");

    final response = await http.get(Uri.parse(getAllServeces));
    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an error.
      throw Exception('Failed to load data');
    }
  }

  parseServices() async {
    final jsonMap = await fetchService();
    final data = jsonMap['data'] as List<dynamic>;
    List<Service> iterable = data
        .map((service) => Service.fromJson(service as Map<String, dynamic>))
        .toList();
    print(iterable.length);
    services.addAll(iterable);
    update();
  }

  @override
  void onInit() {
    parseServices();
    super.onInit();
  }
}
