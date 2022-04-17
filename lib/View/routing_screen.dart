import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/Controller/login.dart';
import 'package:roya_immobilie/View/page/Home/home.dart';
import 'package:roya_immobilie/View/page/auth/Login/login_screen.dart';
import 'package:roya_immobilie/View/page/auth/Login/profile.dart';
import 'package:roya_immobilie/View/page/notification_page.dart';
import '../Model/cityrepo.dart';
import '../Model/joke.dart';
import '../varia_ble/variable.dart';
import 'order/order_distination.dart';
import 'page/searchfilter.dart';
import 'page/chat_page.dart';
import 'page/favorite_page.dart';

List<Joke> allAnnonce = [];

class RoutingScreen extends StatefulWidget {
  static final id = "RoutingScreen";

  @override
  _RoutingScreenState createState() => _RoutingScreenState();

  const RoutingScreen();
}

class _RoutingScreenState extends State<RoutingScreen> {
  // for(int i = 0 ;i<allAnnonce.length ; i++){
  //   for(int j=0; j <Listannonce.length ;j++){
  //     if(allAnnonce[i]==Listannonce[j]){
  //       return ;
  //     }
  //     allAnnonce.add(Listannonce[j]);
  //   }
  //
  // }

  // final CityController annonceController = Get.put(CityController());
  int bottomSelectedIndex = 0;
  var pageController;

  void OnPageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void OnbottomTapped(int index) {
    if ((bottomSelectedIndex - index.abs() == 1)) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutSine);
    } else {
      pageController.jumpToPage(index);
    }
  }

  @override
  void initState() {
    super.initState();

    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
        controller: pageController,
        children: [
          HomePage(),
          FavoritePage(),
          NotificationPage(),
          ChatPage(),
          isLogin ? Profile() : LoginScreen(),
        ],
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: OnPageChanged);

    return ScreenUtilInit(
      builder: () => Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,




        floatingActionButton: FloatingActionButton(
          elevation: 1,
          // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
          isExtended: false,
          backgroundColor: Color.fromARGB(255, 130, 108, 219),
          // mini: true,
          child: SvgPicture.asset(
            'assets/icon/math-plus.svg',
            width: 20.w,
            height: 20.h,
            color: Colors.white,
          ),
          onPressed: () async {
            verify_update = false;
            if (!verify_region_city) {
              await ServicesRgion.getUsers().then(
                (regions) {
                  setState(() {
                    region = regions!;

                    Services.getCity().then((citys) {
                      setState(() {
                        //city=null;
                        listCity = [];
                        city = citys!;
                        for (int i = 0; i < city!.length; i++) {
                          if (1 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_1.add(city![i]);
                          }
                          if (2 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_2.add(city![i]);
                          }
                          if (3 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_3.add(city![i]);
                          }
                          if (4 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_4.add(city![i]);
                          }
                          if (5 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_5.add(city![i]);
                          }
                          if (6 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_6.add(city![i]);
                          }
                          if (7 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_7.add(city![i]);
                          }
                          if (8 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_8.add(city![i]);
                          }
                          if (9 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_9.add(city![i]);
                          }
                          if (10 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_10.add(city![i]);
                          }
                          if (11 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_11.add(city![i]);
                          }
                          if (12 == city![i].regionId) {
                            // id_city=_city![i].id;
                            // print("id region"+ id_city.toString());
                            listCity_Region_12.add(city![i]);
                          }
                        }
                      });
                    });
                  });
                  verify_region_city = true;
                },
              );
            }
            Get.to(Add_Annonce());
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 2,
          iconSize: 20,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.home_filled, color: Colors.black54, size: 25.h),
                label: 'Home'.tr),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              //favor.svg
              icon:  SvgPicture.asset(
                'assets/icon/star.svg',
                color: Colors.black54,
                width: 25.w,
                height: 25.h,
              ),

              label: 'Mes favoris'.tr,
            ),






            BottomNavigationBarItem(

              backgroundColor: Colors.white,
              //favor.svg
              icon: SvgPicture.asset(
                'assets/icon/annonces/favor.svg',
                color: Colors.white,
                width: 25.w,
                height: 25.h,
              ),

              label: 'DEPOSER UNE ANNONCE'.tr,
            ),








            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: SvgPicture.asset(
                'assets/icon/LC_icon_message_fill_1.svg',
                color: Colors.black54,
                width: 25.w,
                height: 25.h,
              ),
              label: 'Chat'.tr,
            ),
            isLogin
                ? BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.person, color: Colors.black54, size: 25),
                    label: 'Tableau De Bord'.tr,
                  )
                : BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.login, color: Colors.black54, size: 25),
                    label: 'Se connecter'.tr,
                  ),
          ],
          onTap: OnbottomTapped,
          selectedItemColor: Color.fromARGB(255, 130, 108, 219),
          unselectedItemColor: Colors.black54,
          currentIndex: bottomSelectedIndex,
        ),
        body: pageView,
      ),
    );
  }
}
//
// isLogin?BottomNavigationBarItem(
// backgroundColor: Colors.white,
// icon: Icon(Icons.person, color: Colors.black54, size: 25),
// label: 'Profile',
// ): BottomNavigationBarItem(
// backgroundColor: Colors.white,
// icon: Icon(Icons.login, color: Colors.black54, size: 25),
// label: 'Login',
// ),
