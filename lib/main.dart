import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Langage/transation.dart';
import 'package:roya_immobilie/View/routing_screen.dart';
import 'package:roya_immobilie/on_boding_screen.dart';
import 'package:roya_immobilie/variable/variable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Model/ability.dart';
import 'Model/ModelAnnonce.dart';
import 'View/page/auth/Login/components/body.dart';
import 'View/page/serche_page.dart';
import 'View/routing_screen.dart';
import 'package:http/http.dart' as http;

import 'View/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,

  ]);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("langagekey")!=null){
        langagevariable = prefs.getString("langagekey")!;
    }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

List<Ability> ability = [];

class _MyAppState extends State<MyApp> {
  List<ModelAnnonce> Listannonce = [];

  Future<void> getUserDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJsoon = json.decode(response.body);
    print(response.statusCode);
    final responseJson = responseJsoon["data"];
    setState(() {
      for (Map user in responseJson) {
        allAnnonce.add(ModelAnnonce.fromJson(user.cast()));
      }
      slug_data = allAnnonce;
      isLoaded=true;
    });
  }
  getability() async {
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
          ListAbility=ability;
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
      debugShowCheckedModeBanner: false,
      //  initialBinding: Binding(),
      translations: Transation(),
      locale: Locale(langagevariable),
      fallbackLocale: Locale('fr'),
      home:SplashScreen()
      // initialRoute: RouteScreen.getHomepage(),
      //     getPages: RouteScreen.route,
    );
  }
}

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
      FocusManager.instance.primaryFocus?.unfocus();
      //Get.offAll(BoardingPage());
      Get.offAll( RoutingScreen());
      if (prefs.getString("token") != null) {
        username = prefs.getString("username")!;
        token_global = prefs.getString("token");
        isLogin = true;
      }
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      Get.offAll(BoardingPage());
    }
  }

  @override
  void initState() {
    super.initState();
    hasFinishedOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(
            "assets/icon/logo-roya.svg",
            width: 150,
            height: 150,
          ))
        ],
      ),
    );
  }
}
