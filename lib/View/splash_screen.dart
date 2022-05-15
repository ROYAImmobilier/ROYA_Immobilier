import 'package:carousel_slider/carousel_slider.dart';
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
                  child:
           Row(
            children: [
              //SizedBox(width: 30,),
              Container(
                height:500,
                width:MediaQuery.of(context).size.width*0.90,
                child: CarouselSlider(
                  options: CarouselOptions(height: 400.0,
                    aspectRatio: 16/9,
                    viewportFraction: 2,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                   // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: dataCategory.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return
                          SvgPicture.asset(
                              i.icon,
                              width: 100,
                              height: 100,
                              color:  Color(0xffC0A280));
                      },
                    );
                  }).toList(),
                ),
              )


            ],
           ),

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
