import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/Home/home.dart';
import 'package:roya_immobilie/View/page/notification_page.dart';
import 'package:roya_immobilie/View/page/serche_page.dart';
import 'package:roya_immobilie/controller.dart';
import 'package:roya_immobilie/main.dart';
import '../Controller/cityController.dart';
import '../Model/anonce_model.dart';
import '../Model/joke.dart';
import 'order/order_distination.dart';
import 'page/searchfilter.dart';
import 'page/chat_page.dart';
import 'page/favorite_page.dart';


List<Joke>allAnnonce = [];
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
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
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
          ChatPage(),
          ChatPage(),
        ],
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: OnPageChanged);

    return  ScreenUtilInit(
        builder: () => Scaffold(
          backgroundColor: Colors.white,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 1,
            // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
            isExtended: true,
            backgroundColor: Color.fromARGB(255, 130, 108, 219),
            // mini: true,
            child: SvgPicture.asset(
              'assets/icon/camera_light.svg',
              width: 30.w,
              height: 30.h,
              color: Colors.white,
            ),
            onPressed: () {

               Get.to(Add_Annonce());
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.home_filled, color: Colors.black54, size: 25),
                  label: 'Annonces'),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                //favor.svg
                icon: SvgPicture.asset(
                  'assets/icon/annonces/favor.svg',
                  color: Colors.black54,
                  width: 25.w,
                  height: 25.h,
                ),

                label: 'Favoris',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.camera, color: Colors.white, size: 20),
                label: 'Annoncer',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: SvgPicture.asset(
                  'assets/icon/LC_icon_message_fill_1.svg',
                  color: Colors.black54,
                  width: 25.w,
                  height: 25.h,
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: SvgPicture.asset(
                  'assets/icon/notification.svg',
                  color: Colors.black54,
                  width: 25.w,
                  height: 25.h,
                ),
                label: 'Notification',
              ),
            ],
            onTap: OnbottomTapped,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            currentIndex: bottomSelectedIndex,
          ),
          body: pageView,
        ),

    );
  }
}
