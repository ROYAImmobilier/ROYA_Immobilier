import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/auth/Login/components/background.dart';
import '../data.dart';
import '../main.dart';
import '../screenSize/screenSized.dart';

class SplashScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    var Screenwidth = MediaQuery.of(context).size.width;
    var Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.only(top: 40,bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset("assets/logo-roya.svg", width: 100,height: 100,),

              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  height: 60,
                  child: ListView.builder(
                    shrinkWrap: true,

    itemCount: dataCategory.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, i) {
          return Row(
            children: [
              SizedBox(width: 15,),
              CircleAvatar(
                backgroundColor:  Colors.white,
                radius: ScreenSized.Avatar(
                        Screenwidth,
                        Screenheight),
                child: SvgPicture.asset(
                        dataCategory[i].icon,
                        width: 40,
                        height: 40,
                        color: const Color(0xffC0A280)),
              ),
            ],
          );
    }),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: GestureDetector(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
