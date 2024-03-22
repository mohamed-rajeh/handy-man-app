// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'dart:convert';

class Crud {
  Future<dynamic> getRequest(String uri) async {
    // await Future.delayed(const Duration(seconds: 3)); // Simulate 3-second delay

    try {
      var response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        return responseBody;
      } else {
        print(
            "Error: HTTP status code ${response.statusCode}"); // More specific error handling
        throw Exception(
            "Failed to fetch data. Status code: ${response.statusCode}"); // Rethrow for further handling
      }
    } catch (e) {
      print("Error fetching data: $e"); // Informative error message
      rethrow; // Rethrow for further handling
    }
  }

  postRequest(String uri, Map data) async {
    try {
      var response = await http.post(Uri.parse(uri), body: data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      }
    } catch (e) {
      print("Error catch $e");
    }
  }
}
