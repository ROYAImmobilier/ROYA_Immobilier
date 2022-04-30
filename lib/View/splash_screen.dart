import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roya_immobilie/View/routing_screen.dart';

import '../main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/logo-roya.svg", width: 100,height: 100,),
          SizedBox(height: 100,),
          GestureDetector(
            onTap: () {
              Get.offAll(OnBoarding(),);
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text(
                    "Bienvenue à ٌRoya Immobilier ",
                  )),
            ),
          )
        ],
      ),
    );
  }
}
