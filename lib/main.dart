import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:roya_immobilie/Langage/transation.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:roya_immobilie/testciyt.dart';

import 'Controller/AnonceController.dart';
import 'Model/anonce_model.dart';
import 'Model/repositery.dart';
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
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      translations: Transation(),
      locale: Locale('fr'),
      fallbackLocale: Locale('fr'),
      home: Add_Annonce(),
    );
  }
}

class Testa extends StatefulWidget {
  const Testa({Key? key}) : super(key: key);

  @override
  State<Testa> createState() => _TestaState();
}

class _TestaState extends State<Testa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: AnnonceRepository.featcherAnnonce(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              //  var totalData = snapshot.data.length;
              print(snapshot.data.length);
              return HomePage(snapshot.data, snapshot.data.length);
            } else {
              return const Center(
                child: Text("No data Available"),
              );
            }
          }
        },
      ),
    );
  }
}
