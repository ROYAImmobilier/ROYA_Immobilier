import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:roya_immobilie/View/page/Home/home.dart';
import 'package:roya_immobilie/View/page/auth/Login/login_screen.dart';
import 'package:roya_immobilie/View/page/Profile/profile.dart';
import 'package:roya_immobilie/View/page/notification_page.dart';

import '../Model/cityrepo.dart';
import '../Model/ModelAnnonce.dart';
import '../variable/variable.dart';
import 'order/order_distination.dart';
import 'page/chat_page.dart';
import 'page/favorite_page.dart';

List<ModelAnnonce> allAnnonce = [];

class RoutingScreen extends StatefulWidget {
  static final id = "RoutingScreen";

  @override
  _RoutingScreenState createState() => _RoutingScreenState();

  const RoutingScreen();
}

class _RoutingScreenState extends State<RoutingScreen> {

  int bottomSelectedIndex = 0;
  var pageController;
  bool prog =false ;
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
          child:prog?CircularProgressIndicator(color: Colors.white,): SvgPicture.asset(
            'assets/icon/math-plus.svg',
            width: 20.w,
            height: 20.h,
            color: Colors.white,
          ),
          onPressed: () async {
            setState(() {
              prog=true;
            });

            verify_update = false;
            if (!verify_region) {
              await ServicesRgion.getUsers().then(
                (regions) {
                  setState(() {
                    region = regions!;
                    verify_region=true;
                  });
                },
              );
            }
setState(() {
  prog=false;
});
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
                icon:
                    Icon(Icons.home_filled, color: Colors.black54, size: 25.h),
                label: 'Home'.tr),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              //favor.svg
              icon: SvgPicture.asset(
                'assets/icon/star.svg',
                color: Colors.black54,
                width: 25.w,
                height: 25.h,
              ),

              label: 'favoris'.tr,
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

              label: 'Vender'.tr,
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: SvgPicture.asset(
                'assets/icon/LC_icon_message_fill_1.svg',
                color: Colors.black54,
                width: 25.w,
                height: 25.h,
              ),
              label: 'Contact'.tr,

            ),
            isLogin
                ? BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.person, color: Colors.black54, size: 25),
                    label: 'Bord'.tr,
                  )
                : BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.login, color: Colors.black54, size: 25),
                    label: 'Compte'.tr,
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
