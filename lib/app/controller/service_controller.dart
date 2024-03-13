import 'package:get/get.dart';
import 'package:ser/components/constant/data.dart';

class ServiceController extends GetxController {
  List services = [].obs;
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

  @override
  void onInit() {
    getService();
    super.onInit();
  }
}
