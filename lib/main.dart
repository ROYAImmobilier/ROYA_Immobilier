import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:roya_immobilie/Langage/transation.dart';
import 'package:roya_immobilie/View/routing_screen.dart';

import 'View/page/Home/home.dart';

import 'View/order/order_distination.dart';
import 'View/routing_screen.dart';
import 'helpear/binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      translations: Transation(),
      locale: Locale('fr'),
      fallbackLocale: Locale('fr'),
      home: RoutingScreen(),
    );
  }
}
