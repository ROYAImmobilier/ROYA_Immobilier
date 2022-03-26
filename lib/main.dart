import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:roya_immobilie/Langage/transation.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:roya_immobilie/testciyt.dart';

import 'Controller/AnonceController.dart';
import 'Model/ability.dart';
import 'Model/anonce_model.dart';
import 'Model/joke.dart';
import 'Model/repositery.dart';
import 'View/page/Home/home.dart';

import 'View/order/order_distination.dart';
import 'View/page/serche_page.dart';
import 'View/routing_screen.dart';
import 'helpear/binding.dart';
import 'package:http/http.dart' as http;
import 'package:roya_immobilie/Model/anonce_model.dart';
void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
List<Ability> ability = [];
class _MyAppState extends State<MyApp> {

  List<Joke> Listannonce = [];

  Future<Null> getUserDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJsoon = json.decode(response.body);
    final responseJson = responseJsoon["data"];
    setState(() {
      for (Map user in responseJson) {
        allAnnonce.add(Joke.fromJson(user.cast()));
        print(allAnnonce.length);
      }});}




  getability() async {
    print("e.");
    try {
      final response = await http
          .get(Uri.parse('https://dashboard.royaimmo.ma/public/api/abilities'));
      if (200 == response.statusCode) {
        var a = response.body;
        var b = json.decode(a);
        print('zzzz :  ');
        print('zzzz :  ' + b[0]["name"]);

        setState(() {
          for (int i = 0; i < b.length; i++) {
            ability.add(
              Ability(
                id: b[i]['id'],
                name: b[i]["name"],
                icon: b[i]["icon"].toString(),
                type: b[i]["type"].toString(),
                createdAt: b[i]["created_at"].toString(),
                updatedAt: b[i]["updated_at"].toString(),
                deletedAt: b[i]["deleted_at"].toString(),
              ),
            );
            print('zzzz :  ' + ability.length.toString());
          }
        });
      }
    } catch (e) {}
  }






  @override
  void initState() {
    super.initState();
    getUserDetails();
    getability();
  }
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
      ClampingScrollWrapper.builder(context, widget!),
      breakpoints: const [
        ResponsiveBreakpoint.resize(350, name: MOBILE),
        ResponsiveBreakpoint.autoScale(600, name: TABLET),
        ResponsiveBreakpoint.resize(800, name: DESKTOP),
      ],),
      debugShowCheckedModeBanner: false,
    //  initialBinding: Binding(),
      translations: Transation(),
      locale: Locale('fr'),
      fallbackLocale: Locale('fr'),
      home: RoutingScreen(),
    );
  }
}
/*
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
}*/
