import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:roya_immobilie/Langage/transation.dart';
import 'package:roya_immobilie/RouteScreen/routeScreen.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:roya_immobilie/on_boding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Model/ability.dart';
import 'Model/joke.dart';
import 'View/page/serche_page.dart';
import 'View/routing_screen.dart';
import 'package:http/http.dart' as http;

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
  Future<void> getUserDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJsoon = json.decode(response.body);
    final responseJson = responseJsoon["data"];
    setState(() {
      int i =0;
      for (Map user in responseJson) {
        allAnnonce.add(Joke.fromJson(user.cast()));
        print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

        print(allAnnonce[i].cover);
        i++;
      }});}

  getability() async {
    print("e.");
    try {
      final response = await http
          .get(Uri.parse('https://dashboard.royaimmo.ma/public/api/abilities'));
      if (200 == response.statusCode) {
        var a = response.body;
        var b = json.decode(a);
        setState(() {
          for (int i = 0; i < b.length; i++) {
            ability.add(
              Ability(
                id: b[i]['id'],
                name: b[i]["name"],
                icon: "lib/abilities/${b[i]["icon"].toString()}.svg",
                type: b[i]["type"].toString(),
                createdAt: b[i]["created_at"].toString(),
                updatedAt: b[i]["updated_at"].toString(),
                deletedAt: b[i]["deleted_at"].toString(),
              ),
            );

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
    return
      GetMaterialApp(
      debugShowCheckedModeBanner: false,
    //  initialBinding: Binding(),
      translations: Transation(),
      locale: Locale('fr'),
      fallbackLocale: Locale('fr'),
    home: OnBoarding(),
    // initialRoute: RouteScreen.getHomepage(),
    //     getPages: RouteScreen.route,
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

class OnBoarding extends StatefulWidget {


  @override
  State createState() {
    return OnBoardingState();
  }
}

class OnBoardingState extends State<OnBoarding> {

  Future hasFinishedOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool finishedOnBoarding = (prefs.getBool('finishedOnBoarding') ?? false);

    if (finishedOnBoarding) {
     Get.offAll(OnBoardingScreen());
     // Get.to(const RoutingScreen());
    } else {

      Get.offAll(OnBoardingScreen());
    }

  }

  @override
  void initState() {


    super.initState();
    hasFinishedOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset("assets/icon/logo-roya.svg" , width: 150,height: 150,))
        ],
      ),
    );
  }
}

