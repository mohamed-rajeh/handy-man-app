// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:ser/components/constant/data.dart';

import '../model/service_model.dart';
import 'crud.dart';
import 'package:http/http.dart' as http;

class ServiceController extends GetxController {
  List services = [].obs;
  var isAll = true.obs;
  var selectedCategory = 0.obs;
  final Crud _crud = Crud();

  checkCat(cat) {
    selectedCategory.value = cat;
    isAll.value = cat == 0;
  }

  getService() {
    // This well return the puperal service then rest
    services.addAll(servicesData);
  }

  String img = "http://10.0.2.2/ser/images/";
  Future<Map> fetchService() async {
    print("started");
    String url = "http://10.0.2.2/ser/service/get_services.php";

    final response = await http.get(Uri.parse(url));
    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an error.
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchSedrvice() async {
    const serverUrl = "http://10.0.0.2/ser/service/get_services.php";

    try {
      final responseBody = await _crud.getRequest(serverUrl);
      print(responseBody);
      final data = responseBody['data'] as List<dynamic>;
      services.addAll(data
          .map((service) => Service.fromJson(service as Map<String, dynamic>))
          .toList());
    } catch (e) {
      print("Error fetching services: $e");
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
  }

  @override
  void onInit() {
    parseServices();
    super.onInit();
  }
}
