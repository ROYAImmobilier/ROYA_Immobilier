import 'package:get/get.dart';
import 'package:roya_immobilie/Controller/AnonceController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnnonceController());
  }
}
