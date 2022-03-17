import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:roya_immobilie/Model/cityrepo.dart';

import '../Model/city.dart';
import '../Model/repositery.dart';

// class CityController extends GetxController {
//   var isLoading = true.obs;
//   var citytList = [].obs;
//   @override
//   void onInit() {
//     getCity();
//     super.onInit();
//   }
//
//   getCity() async {
//     try {
//       isLoading(true);
//       var products = await CityRepo.fetchCity();
//       if (products != null) {
//         citytList.assignAll(products);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }
class CityController extends GetxController {
  AnnonceController() {
    getCity();
  }

  List<City> ListCity = [];

  getCity() async {
    try {
      var annonce = await CityRepo.fetchCity();

      //print("annonce " + annonce.toString());
      //var d = annonceFromJson(annonce);

      //print("+++ " + annonce.length.toString());
      /* if (annonce != null) {
        ListAnnonce.value = annonce as List<Annonce>;
        print(ListAnnonce.length);
      }*/
    } catch (e) {
    } finally {}
  }
}
